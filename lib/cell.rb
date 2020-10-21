require "./lib/ship"

class Cell
  attr_reader :ship, :coordinate, :fired_upon

  def initialize(coordinate)
    @ship = nil
    @coordinate = coordinate
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    fired_upon
  end

  def fire_upon
    @ship.hit if ship != nil && fired_upon == false

    @fired_upon = true
  end

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
    display = render()
    if display == "M"
      "miss"
    elsif display == "H"
      "hit"
    else 
      "hit and sunk the ship"
    end
  end

  def reset
    if @ship
      @ship.reset
    end

    @ship = nil 
    @fired_upon = false
  end
end
