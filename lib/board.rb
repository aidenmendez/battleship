class Board
  attr_reader :cells

  def initialize()
    @cells = {
      "A1" => Cell.new("a1")
    }
  end

end