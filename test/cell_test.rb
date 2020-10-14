require "minitest/autorun"
require "minitest/pride"
require "./lib/cell"
require "./lib/ship"


class CellTest < Minitest::Test
  def setup
    @cell_empty = Cell.new("Z100")
    @cell = Cell.new("A1")
    # render class cells use cell_1 & cell_2
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")

    @cruiser = Ship.new("cruiser",3)
    @cell.place_ship(@cruiser)
    @cell_2.place_ship(@cruiser)

  end

  def test_it_exists
    assert_instance_of Cell, @cell_empty
  end

  def test_attributes_exist
    assert_nil @cell_empty.ship
    assert_equal "Z100", @cell_empty.coordinate
  end

  def test_cell_empty_by_default
    assert_equal true, @cell_empty.empty?
  end

  def test_can_place_ship_in_cell
    assert_equal true, @cell_empty.empty?
    @cell_empty.place_ship(@cruiser)
    assert_equal "cruiser", @cell_empty.ship.name
    assert_equal false, @cell_empty.empty?
  end

  def test_cell_fired_upon_false_by_default
    assert_equal false, @cell.fired_upon?
  end

  def test_if_fire_upon_changes_fired_upon
    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
  end

  def test_render_returns_correctly
    assert_equal ".", @cell_1.render
  end


end
