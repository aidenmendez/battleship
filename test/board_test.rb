require "Minitest/autorun"
require "Minitest/pride"
require "./lib/board"
require "./lib/cell"
require "./lib/ship"

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
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
    assert @board.valid_coordinate?("A1")
    assert @board.valid_coordinate?("d4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_valid_placement_method_exists
    refute_nil @board.valid_placement?(@cruiser, ["A1", "A2"])
  end
end