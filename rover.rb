class Rover
  attr_accessor :x, :y, :direction
  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction_options = ["N", "E", "S", "W"]
    @direction = direction
  end

  def read_instruction(instruction)
      if instruction.is_a?(Integer) == true


      else
        # case instruction

        # end

      end
  end

  def move(distance)



  end

  def turn(turn_dir)
    case turn_dir
    when "L"
      @direction = @direction_options[(@direction_options.index(@direction) - 1)]

    end



  end

  def test

    puts @direction = @direction_options[@direction_options.index(@direction)]
  end

end


bob = Rover.new(0,0,"N")
5.times do
bob.turn("L")
puts bob.direction

end