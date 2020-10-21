require "minitest/autorun"
require "minitest/pride"
require "./lib/cell"
require "./lib/ship"
require "mocha/minitest"

class CellTest < Minitest::Test
  def setup
    @cell_empty = Cell.new("Z100")
    @cell = Cell.new("A1")
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

  def test_render_returns_miss_correctly
    assert_equal ".", @cell_1.render

    @cell_1.fire_upon

    assert_equal "M", @cell_1.render
  end

  def test_render_returns_hit_correctly
    assert_equal ".", @cell_2.render

    @cell_2.fire_upon
    
    assert_equal "H", @cell_2.render

    @cell_2.ship.hit
    @cell_2.ship.hit

    assert_equal "X", @cell_2.render
  end

  def test_render_returns_see_ship_correctly
    assert_equal ".", @cell_2.render

    see_ship = true

    assert_equal "S", @cell_2.render(see_ship)
  end

  def test_fired_result_is_correct
    cell_3 = Cell.new("D4")
    armed_row_boat = Ship.new("row_boat", 1)
    cell_3.place_ship(armed_row_boat)

    @cell_1.fire_upon 
    @cell.fire_upon 
    cell_3.fire_upon

    assert_equal "miss", @cell_1.fired_result
    assert_equal "hit", @cell.fired_result
    assert_equal "hit and sunk the ship", cell_3.fired_result
  end 

  def cell_can_reset
    @cell.reset 

    assert_nil @cell.ship 
    assert_equal false, @cell.fired_upon
  end
end
