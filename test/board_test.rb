require "Minitest/autorun"
require "Minitest/pride"
require "./lib/board"
require "./lib/cell"
require "./lib/ship"

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @coordinates1 = ["A1", "A2", "A3"]
    @coordinates2 = ["A1", "B1"]
    @empty_board = "  1 2 3 4 \n" + "A . . . . \n" + "B . . . . \n" + "C . . . . \n" + "D . . . . \n"
    @see_ships_board = "  1 2 3 4 \n" + "A S S S . \n" + "B . . . . \n" + "C . . . . \n" + "D . . . . \n"

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

  def test_validates_ship_length_with_coordinates
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_placement_method_works_zzz
    assert @board.place(@cruiser, @coordinates1)
  end

  def test_board_renders_correctly
    assert_equal @empty_board, @board.render
  end

  def test_board_renders_with_see_ships
    @board.place(@cruiser, @coordinates1)
    assert_equal @see_ships_board, @board.render(true)
  end

  def test_it_can_reset_board
    @board.place(@cruiser, @coordinates1)
    @board.reset_board

    assert_nil @board.cells["A1"].ship
    assert_equal false, @board.cells["A1"].fired_upon
  end 
end