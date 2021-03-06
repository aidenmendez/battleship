require './lib/validator'

class Board
  attr_reader :cells, :last_square

  def initialize()
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
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
    @last_square = cells.keys.sort[-1]
  end

  def valid_coordinate?(coordinate)
    cells.key?(coordinate.upcase) && cells[coordinate.upcase].empty?
  end

  def valid_shot?(coordinate)
    cells.key?(coordinate.upcase)
  end

  def valid_placement?(ship, coordinates)
    if coordinates.all? { |coord| valid_coordinate?(coord) }
      @validator.check_coords(coordinates, ship.length) 
    else
      false
    end
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
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
    
    rendered_board
  end

  def reset_board 
    @cells.each do |cell, cell_value|
      cell_value.reset
    end
  end
end