require_relative 'rules'
require_relative 'game_state'

class World
  
  def initialize(initial_state, screen)
    @state = GameState.new(initial_state)
    @next_state = GameState.new
    @screen = screen
  end

  def tick
    @state.display_on(@screen)
    calculate_next_state    
    go_to_next_state
  end
  
  def calculate_next_state
    @state.for_each do |cell, row_index, cell_index|
      run_rules_for(cell, row_index, cell_index)
    end 
  end

  def go_to_next_state
    @state = @next_state
    @next_state = GameState.new
  end

  def run_rules_for(cell, x, y)
    rules = Rules.new
    
    @state.run_for_alive_around(x,y) { rules.another_neighbour! } 
    
    alive = lambda { @next_state.set(true, x, y) }
    dead = lambda { @next_state.set(false, x, y) }
    
    rules.apply(cell, alive, dead)

    nil
  end

  
end