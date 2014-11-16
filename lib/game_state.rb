class GameState

  def initialize(state = [])
    @state = state
  end

  def display_on(screen)
    screen.display(@state) 
  end

  def for_each
    @state.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        yield(cell, row_index, cell_index)
      end
    end
  end

  def set(state, x,y)
    if @state[x] == nil
      @state[x] = []
    end  
    @state[x][y] = state
    nil
  end

  def alive_at?(x,y)
    return nil if x < 0 || y < 0
    return nil unless @state[x]
    if @state[x][y]
      yield
    end
    nil
  end

  def run_for_alive_around(x,y)
    run_around(x,y) do |i,j|
      alive_at?(i,j) { yield } 
    end
  end

  def run_around(x,y)
    (x-1..x+1).each do |i|
      (y-1..y+1).each do |j|
          yield(i,j) unless i == x && j == y
      end
    end
  end


end
