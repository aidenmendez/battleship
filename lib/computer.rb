require "./lib/board"
require "./lib/ship"

class Computer
  attr_reader :board, :ships

  def initialize()
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ships = [@cruiser, @submarine]
  end

  def setup
    coordinates = []
    ships.each do |ship|
      coordinates = random_coordinates( @board, ship.length)

      until board.valid_placement?(ship, coordinates) do
        coordinates = random_coordinates( @board, ship.length)
      end

      @board.place(ship, coordinates)
    end

    puts "I have laid out my ships on the grid.\n You now need to lay out your two ships.\n The Cruiser is three units long and the Submarine is two units long."
    coordinates
  end
 
  def render_board
    puts "==============COMPUTER BOARD=============="
    puts @board.render
  end 

  def shot_at(coordinate)
    @board.cells[coordinate].fire_upon
  end 

  def shot_result(coordinate)
    @board.cells[coordinate].fired_result
  end
 
  # This method takes a board, and a number of coordinates, and randomly returns adjacent coordinates in an array
  def random_coordinates(board, number_coordinates)
    last_square = board.cells.keys.sort[-1]
    max_letter = last_square[0]
    max_number = last_square[1..-1].to_i
    horizontal_ship = [true, false].sample
    random_coordinates = []

    if horizontal_ship
      starting_letter = rand(65..max_letter.ord).chr
      starting_number = rand(1..(max_number + 1 - number_coordinates))

      number_coordinates.times do 
        random_coordinates << starting_letter + starting_number.to_s
        starting_number += 1
      end
      
    else
      starting_letter = rand(65..max_letter.ord + 1 - number_coordinates).chr
      starting_number = rand(1..max_number)

      number_coordinates.times do 
        random_coordinates << starting_letter + starting_number.to_s
        
        starting_letter = (starting_letter.ord + 1).chr
      end 
    end

    random_coordinates
  end 

  def random_shot

  end
end 