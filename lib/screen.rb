class Screen

  def display(input)
    output = ""
    input.each do |line|
      line.each do |alive|
        char = alive ? "X" : " "
        output = output + char
      end
      output = output + "\n"
    end
    puts output
  end

end