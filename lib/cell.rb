class Cell
  attr_reader :ship, :coordinate

  def initialize(coordinate)
    @ship = nil
    @coordinate = coordinate
  end

# returns true if cell empty, otherwise false
  def empty?
    @ship == nil
  end
end
