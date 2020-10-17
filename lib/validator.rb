

#### 
class Validator
  attr_reader :coordinates, :length 

  def initialize(coordinates, length)
    @coordinates = coordinates
    @length = length
    @acceptable_coords = [
      "A1",
      "A2",
      "A3",
      "A4",
      "B1",
      "B2",
      "B3",
      "B4",
      "C1",
      "C2",
      "C3",
      "C4",
      "D1",
      "D2",
      "D3",
      "D4"
    ]
  end 

  def length?()
    @length == @coordinates.length
  end

  # As of now, acceptable_coord? is redundant with the valid_coordinate? method in board.
  def acceptable_coords?
    valid_coord_count = 0
    @coordinates.each do |coordinate|
      valid_coord_count += 1 if @acceptable_coords.include?(coordinate)
    end

    valid_coord_count == @coordinates.length
  end

  # This helper method is passed an array of values, and checks whether the values are the same (0), or sequential (1). Otherwise it returns (2)
  def array_checker(array)
    if array.all? {|char| char == array[0]}
      0
      # If the values of the array are all the same, return 0
      # :vertical
    elsif array.uniq.length != array.length
      2
      # If some but not all values are the same, return 2
      # :nonconsecutive_letters     #more descriptive for error-handling/ debugging
    elsif array.all?((array[0])..(array[0] + @length - 1))
      1
      # If all values are unique and sequential return 1
      # :horizontal
    else
      2
      # :invalid_letters
    end

  end 

  def validate_lets
    letters = []
    
    @coordinates.each do |coordinate|
          # coordinate is "A1"
      letters << coordinate[0]
    end

    letters = letters.map do |let|
      let.ord
    end

    array_checker(letters)
  end

  def validate_nums
    numbers = []

    @coordinates.each do |coordinate|
      # coordinate is "A1"
      numbers << coordinate.delete("A-Z")
    end

    numbers = numbers.map do |num|
      num.to_i
    end

    array_checker(numbers)
  end

  def check_coords
    length? && (validate_lets + validate_nums == 1)
    # the validate methods return 1 if values are sequential, 0 if they are the same, and 2 if values are invalid. For valid coordinates, within letters and numbers one must always be the same, and the other sequential. Therefore they must always sum to 1. 
    # length? && acceptable_coords? && validate_nums == validate_lets

  end

    #Psuedo code:
    # 
    # letter_validator that takes a coord [] 
    #    letter_validator extracts letters into []
    #       check range of letter []
    #       check letters are all same or all incremental
    #           if !same, check incremental by 1 only
    #                   use each_cons()
    #                   if arr[0].each_cons(arr.length) == arr
    #                     return :horizontal = true
    #       return a symbol, either :horizontal (incremental) or :vertical (same)
    #           if same, :vertical
    #           if not same, :horizontal 
    # 
    #     
    # 
    # check_coordinates method (user inputs are kosher)
    #   this method is used for coordinate validation, 
    #       length? 
    #       letter_validator
    #       number_validator
    #       
    # 
    # check_placement method (check ships can be placed)
    #   this method is used to verify a ship can be placed in the given coords.
    #       check_coordinates
    #       check_unoccupied
    #       return true
end 