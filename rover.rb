$plateau_width = 10
$plateau_height = 10
class Rover

  attr_accessor :x, :y, :direction
  def initialize(x, y, direction = "N")
    @x = x
    @y = y
    @direction_options = ["N", "E", "S", "W"]
    @direction = direction
  end

  def to_s
    "Position: (#{@x}, #{@y}), Direction: #{@direction}"
  end

  def request_move(inputstring)
    print "Your starting position is:"
    print self
    print "\n"
    puts "You have requested the following moves: #{inputstring}"
    inputstring.each_char { |inputchar|
      read_instruction(inputchar)
    }
  end

  def read_instruction(instruction)
    puts "Executing move #{instruction}"
    case instruction
    when "M"
      move
      puts self
    when "L", "R"
      turn(instruction)
      puts self
    else
      puts "Your instruction #{instruction} is not valid.  Please enter L, R, or M."
    end
  end

  def move
    case @direction
    when "N"
      @y += 1 unless y == $plateau_height
    when "E"
      @x += 1 unless x == $plateau_width
    when "S"
      @y -= 1 unless y == 0
    when "W"
      @x -= 1 unless x == 0
    end
  end

  def turn(turn_dir)
    case turn_dir
    when "L"
        if @direction != "N"
          @direction = @direction_options[(@direction_options.index(@direction) - 1)]
        else
          @direction = "W"
        end
    when "R"
        if @direction != "W"
          @direction = @direction_options[(@direction_options.index(@direction) + 1)]
        else
          @direction = "N"
        end
    end
  end

  def test

    puts @direction = @direction_options[@direction_options.index(@direction)]
  end

end

rover = Rover.new(0,0)

rover.request_move("MMLMRMLMMMX")

#TESTING
# 4.times do
#   rover.turn("L")
#   20.times do
#     rover.move
#     puts rover
#   end
# end







# inputstring.each_character {|x|  }
#
# array.rotate
# rotates array to help you figure out what direction it's facing