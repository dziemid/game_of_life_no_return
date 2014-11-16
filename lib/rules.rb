class Rules

  def initialize
    @neighbours = 0
  end    

  def another_neighbour!
    @neighbours = @neighbours + 1
  end

  def apply(state, alive, dead)
    if (@neighbours == 2 && state) || @neighbours == 3
      alive.call 
    else
      dead.call
    end  
    nil
  end

end