require "Minitest/autorun"
require "Minitest/pride"
require "./lib/computer"
require "./lib/board"
require "./lib/cell"
require "./lib/validator"

class ComputerTest < Minitest::Test 
  def test_computer_has_board_when_instantiated
    @user.setup
    assert_instance_of Board, @user.board
  end
  
  def test_computer_exists
    computer = Computer.new

    assert computer
  end 

  def test_computer_can_make_random_coordinates
    computer = Computer.new 
    board = Board.new 

    assert_instance_of Array, computer.random_coordinates(board, 3)
    assert_equal 3, computer.random_coordinates(board, 3).length
  end 

  # def test_can_setup
  #   computer = Computer.new
  #   random_coordinates = computer.setup 

  #   # require 'pry'; binding.pry
  #   assert_equal true, computer.board.validator.check_coords(random_coordinates, computer.ships[1].length)
  # end

  def test_shot_at_works
    skip
    # skipped due to cli
    assert_equal false, @user.board.cells["A1"].fired_upon?
    
    @user.shot_at("A1")

    assert @user.board.cells["A1"].fired_upon?
  end 

  def test_shot_result_works
    skip
    # skipped due to cli
    @user.shot_at("A1")

    assert_equal "miss", @user.shot_result("A1")
  end 

end