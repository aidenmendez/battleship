

#### 
class Validator

  # This helper method is passed an array of values, and checks whether the values are the same (0), or sequential (1). Otherwise it returns (2)
  def array_checker(array)
    if array.all? {|char| char == array[0]}
      0
      # If the values of the array are all the same, return 0
    elsif array.uniq.length != array.length
      2
      # If some but not all values are the same, return 2
    elsif array.all?((array[0])..(array[0] + array.length - 1))
      1
      # If all values are unique and sequential return 1
    else
      2
    end
  end 

  def validate_lets(coordinates)
    letters = []
    
    coordinates.each do |coordinate|
          # coordinate is "A1"
      letters << coordinate[0]
    end

    letters = letters.map do |let|
      let.ord
    end

    array_checker(letters)
  end

  def validate_nums(coordinates)
    numbers = []

    coordinates.each do |coordinate|
      # coordinate is "A1"
      numbers << coordinate.delete("A-Z")
    end

    numbers = numbers.map do |num|
      num.to_i
    end

    array_checker(numbers)
  end

  def check_coords(coordinates, length)
    valid_lets = validate_lets(coordinates)
    valid_nums = validate_nums(coordinates)

    valid = (coordinates.length == length) && (valid_lets + valid_nums == 1)
  end
end 