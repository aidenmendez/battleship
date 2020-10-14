require "minitest/autorun"
require "minitest/pride"
require "./lib/cell"
require "./lib/ship"


class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("A1")
    @cruiser = Ship.new("cruiser",3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_attributes_exist
    assert_equal nil, @cell.ship
    assert_equal "A1", @cell.coordinate
  end

  def test_cell_empty_by_default
    assert_equal true, @cell.empty?
  end

  def test_can_place_ship_in_cell
    assert_equal true, @cell.empty?
    @cell.place_ship(@cruiser)
    assert_equal "cruiser", @cell.ship.name
    assert_equal false, @cell.empty?
  end
end
