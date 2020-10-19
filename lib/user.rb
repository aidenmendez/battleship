require "./lib/board"
require "./lib/cell"

class User
  attr_reader :board

  def initialize()
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ships = [@cruiser, @submarine]
  end

  def setup
    ships.each do |ship|
    puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
    coordinates = gets.chomp
    board.place(ship, coordinates)
    # validate coordinates
    
    # ask for new input if invalid
    # update user's board
  end
end