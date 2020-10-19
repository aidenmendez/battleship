require "Minitest/autorun"
require "Minitest/pride"
require "./lib/board"
require "./lib/computer"

class ComputerTest < Minitest::Test 
  
  def test_computer_exists
    computer = Computer.new

    assert computer
  end 

  def test_computer_can_make_random_coordinates
    computer = Computer.new 
    board = Board.new 

    assert_instance_of Array, computer.random_coordinates(board, 3)

  end 
end 