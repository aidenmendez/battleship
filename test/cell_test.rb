require "minitest/autorun"
require "minitest/pride"
require "./lib/cell"
require "./lib/ship"


class CellTest < Minitest::Test
  def setup
    @cell.place_ship(@cruiser)
    @cell_empty = Cell.new("Z100")
    @cell = Cell.new("A1")
    @cruiser = Ship.new("cruiser",3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell_empty
  end

  def test_attributes_exist
    assert_equal nil, @cell_empty.ship
    assert_equal "A1", @cell_empty.coordinate
  end

  def test_cell_empty_by_default
    assert_equal true, @cell_empty.empty?
  end

  def test_can_place_ship_in_cell
    assert_equal true, @cell.empty?
    assert_equal "cruiser", @cell.ship.name
    assert_equal false, @cell.empty?
  end


end
