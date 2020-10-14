class Cell
  attr_reader :ship, :coordinate, :fired_upon

  def initialize(coordinate)
    @ship = nil
    @coordinate = coordinate
    @fired_upon = false
  end

# returns true if cell empty, otherwise false
  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

# returns boolean
  def fired_upon?
    fired_upon
  end

# might add ship damage stuff here
  def fire_upon
    @fired_upon = true
  end

end
