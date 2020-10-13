require "./lib/ship.rb"
require "Minitest/autorun"
require "Minitest/pride"

class ShipTest < Minitest::Test
  def test_it_exists
    ship = Ship.new("cruiser", 3)
    assert_instance_of Ship, ship
  end


end