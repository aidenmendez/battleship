require "./lib/ship.rb"
require "Minitest/autorun"
require "Minitest/pride"

class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("cruiser", 3)

  end
  
  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_ship_attributes
    assert_equal "cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
    assert_equal 3, @cruiser.health
  end

  def test_ship_not_sunk_by_default
    assert_equal false, @cruiser.sunk?
  end
end