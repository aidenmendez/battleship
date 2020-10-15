require "Minitest/autorun"
require "Minitest/pride"
require "./lib/board"
require "./lib/cell"

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_makes_cells
    assert_instance_of Hash, @board.cells
  end

  def test_board_contains_all_cells
    assert_equal 16, @board.cells.count
  end

  def test_it_validates_coordinate
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("d4")
  end
end