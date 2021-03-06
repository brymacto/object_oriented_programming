#set default plateau
$plateau_width = 10
$plateau_height = 10

class Rover

  attr_accessor :x, :y, :direction
  def initialize(x, y, direction = "N", name = "John Doe Rover")

    @x = x
    @y = y
    @direction_options = ["N", "E", "S", "W"]

    case direction
    when "N", "E", "S", "W"
      @direction = direction
    else
      @direction = "N" # Default to North
    end
    @name = name
  end

  def to_s
    "Position: (#{@x}, #{@y}), Direction: #{@direction}"
  end

  def request_move(inputstring)
    print "Your starting position is:"
    print self
    print "\n"
    puts "You have requested the following moves for #{@name}: #{inputstring}"
    inputstring.each_char { |inputchar|
      read_instruction(inputchar)
    }
  end

  def read_instruction(instruction)
    print "Executing move #{instruction}"
    case instruction
    when "M"
      print " (Move)\n"
      move
      puts self
    when "L", "R"
      print " (Turn)\n"
      turn(instruction)
      puts self
    else
      puts "\nYour instruction #{instruction} is not valid."
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

def get_starting_position
  starting_position = gets.chomp
  starting_position_x = starting_position.split[0].to_i
  if starting_position_x > $plateau_width
    starting_position_x = $plateau_width
  elsif starting_position_x < 0
    starting_position_x = 0
  end
  starting_position_y = starting_position.split[1].to_i
  if starting_position_y > $plateau_height
    starting_position_y = $plateau_height
  elsif starting_position_y < 0
    starting_position_y = 0
  end
  starting_position_direction = starting_position.split(" ")[2]
  [starting_position_x, starting_position_y, starting_position_direction]
end

puts "Please input the plateau width and plateau height in the format X Y, where (x,y) is the upper-right coordinates of the plateau."
$plateau = gets.chomp
$plateau_width = $plateau.split[0].to_i
$plateau_height = $plateau.split[1].to_i
puts "Your plateau has a width of #{$plateau_width} and a height of #{$plateau_height}"

# Get starting position for Rover 1
puts "Please input Rover 1's starting position in the format X Y Direction (example 0 0 N) "
# Create Rover 1
rover1_position = get_starting_position
rover1 = Rover.new(rover1_position[0],rover1_position[1],rover1_position[2], "Spirit Rover")
puts rover1

# Get and execute moves for Rover 1
puts "Please enter your moves for Rover 1. Use M, L, and R in format MLRMLRMM."
rover_moves = gets.chomp
rover1.request_move(rover_moves)


# Get starting position for Rover 2
puts "Please input Rover 2's starting position in the format X Y Direction (example 0 0 N) "
# Create Rover 1
rover2_position = get_starting_position
rover2 = Rover.new(rover2_position[0],rover2_position[1],rover2_position[2], "Opportunity Rover")
puts rover2

# Get and execute moves for Rover 2
puts "Please enter your moves for Rover 2. Use M, L, and R in format MLRMLRMM."
rover_moves = gets.chomp
rover2.request_move(rover_moves)



# TO DO: Rover 1 and Rover 2 have some repetitive code... to be refactored.