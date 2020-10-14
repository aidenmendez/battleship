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

  def fired_upon?
    fired_upon
  end

end
