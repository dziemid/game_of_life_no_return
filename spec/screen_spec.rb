require 'screen'

describe Screen do
  
  it "should display nothing for empty array" do

    expect { subject.display([]) }.to output("\n").to_stdout
    
  end

  it "should display X for living cell" do

    expect { subject.display([[true]]) }.to output("X\n\n").to_stdout
    
  end

  it "should not display X for dead cell" do

    expect { subject.display([[false]]) }.to output(" \n\n").to_stdout
    
  end

  it "should display a world" do

    expect { subject.display([
      [false,true,false],
      [false,true,false],
      [true,true,false],
      ]) }.to output(" X \n X \nXX \n\n").to_stdout
    
  end

end