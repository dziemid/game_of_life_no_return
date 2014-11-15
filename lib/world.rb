class World
  def initialize(initial_state, screen)
    @state = initial_state
    @screen = screen
  end

  def tick
    @screen.display(@state)
  end

end