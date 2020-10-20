require './lib/validator'

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
    @validator = Validator.new()
  end

  def valid_coordinate?(coordinate)
    cells.key?(coordinate.upcse) && cells[coordinate.upcase].empty?
    # @validator.acceptable_coordinate?(coordinate, @cells)
  end

  def valid_placement?(ship, coordinates)
    valid = false
    valid == true if coordinates.all? { |coord| valid_coordinate?(coord) }
    if valid == true
      @validator.check_coords(coordinates, ship.length, @cells) 
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(see_ships = false)
    rendered_board = "  1 2 3 4 \nA"
    sorted_coordinates = @cells.keys.sort
    sorted_coordinates.each do |coordinate|
      next_coordinate = sorted_coordinates[(sorted_coordinates.find_index(coordinate) + 1)]
      if next_coordinate == nil
        rendered_board += " #{@cells[coordinate].render(see_ships)} \n"
        break
      elsif coordinate[0] == next_coordinate[0]
        rendered_board += " #{@cells[coordinate].render(see_ships)}"
      elsif coordinate[0] != next_coordinate[0] && next_coordinate[0] != nil
        rendered_board += " #{@cells[coordinate].render(see_ships)} \n#{next_coordinate[0]}"
      end
    end
    
    # require 'pry'; binding.pry
    rendered_board

  end
end