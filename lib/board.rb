class Board
  attr_reader :cells

  def initialize()
    @cells = {
      "A1" => Cell.new("a1"),
      "A2" => Cell.new("a2"),
      "A3" => Cell.new("a3"),
      "A4" => Cell.new("a4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")

    }
  end

end