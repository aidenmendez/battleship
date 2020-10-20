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

# returns display based on state of cell, if passed true CAN return S, but does not always
  def render(see_ship = false)
    display = "."
    display = "S" if see_ship == true && ship
    if fired_upon && ship
      display = "H"
      display = "X" if ship.sunk?
    elsif fired_upon
      display = "M"
    end
    display
  end

  def fired_result
    if render == "M"
      "miss"
    elsif render == "H"
      "hit"
    else 
      "hit and sunk the ship"
    end
  end
end
