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
      coordinates = gets.chomp.split

      until board.valid_placement?(ship, coordinates) do
        puts "Those are invalid coordinates. Please try again:"
        coordinates = gets.chomp.split
      end
      
      board.place(ship, coordinates)
    end
  end
end