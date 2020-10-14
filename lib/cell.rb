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

# if ship exists in cell & has not been hit in this cell, it calls ship.hit. This method returns true.
  def fire_upon
    @ship.hit if ship != nil && fired_upon == false

    @fired_upon = true
  end

end
