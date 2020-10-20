require "./lib/board"
require "./lib/cell"
require "./lib/ship"

class User
  attr_reader :board, :ships

  def initialize()
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ships = [@cruiser, @submarine]
  end

  def setup
    ships.each do |ship|
      puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
      coordinates = gets.chomp.upcase.split

      until board.valid_placement?(ship, coordinates) do
        puts "Those are invalid coordinates. Please try again:"
        coordinates = gets.chomp.upcase.split
      end
      
      board.place(ship, coordinates)
    end
  end

  def render_board
    puts "==============PLAYER BOARD=============="
    puts @board.render(true)
  end 

  def shot_at(coordinate)
    @board.cells[coordinate].fire_upon
  end 

  def shot_result(coordinate)
    @board.cells[coordinate].fired_result
  end

  def get_coordinate
    puts "Your turn. Enter the coordinate for your shot:"
    gets.chomp.upcase
  end
end