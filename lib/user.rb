require "./lib/board"
require "./lib/cell"

class User
  attr_reader :board

  def initialize()
    @board = Board.new
  end

  def setup
    puts "Enter the squares for the Cruiser (3 spaces):"
    coordinates = gets.chomp
  end
end