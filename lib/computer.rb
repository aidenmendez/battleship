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
 
  def random_coordinates(number_coordinates)
    max_letter = board.last_square[0]
    max_number = board.last_square[1..-1].to_i
    horizontal_ship = [true, false].sample
    limiting_range = 1 - number_coordinates

    if horizontal_ship
      random_horizontal_ship(max_letter, max_number, limiting_range, number_coordinates)
    else
      random_vertical_ship(max_letter, max_number, limiting_range, number_coordinates)
    end
  end 

  def random_horizontal_ship(max_letter, max_number, limiting_range, number_coordinates)
    random_coordinates = []
    starting_letter = rand(65..max_letter.ord).chr
    starting_number = rand(1..(max_number + limiting_range))

    number_coordinates.times do 
      random_coordinates << starting_letter + starting_number.to_s
      starting_number += 1
    end

    random_coordinates
  end

  def random_vertical_ship(max_letter, max_number, limiting_range, number_coordinates)
    random_coordinates = []

    starting_letter = rand(65..max_letter.ord + limiting_range).chr
    starting_number = rand(1..max_number)

    number_coordinates.times do 
      random_coordinates << starting_letter + starting_number.to_s
      starting_letter = (starting_letter.ord + 1).chr
    end 

    random_coordinates
  end
end 