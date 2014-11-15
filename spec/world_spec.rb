require 'world'

describe World do 

  it "should display initial state when tick is called" do
    screen = double("screen", :display)
    initial_state = [ [true, true], [true, true] ]
    world = World.new(initial_state,screen)

    world.tick

    expect(screen).to have_received(:display).with(initial_state)
  end
  
end