class Cell
  attr_reader :ship, :coordinate

  def initialize(coordinate)
    @ship = nil
    @coordinate = coordinate
  end
end
