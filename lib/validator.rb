class Validator

  def array_increments_by(array)
    if array.all? {|char| char == array[0]}
      0
    elsif array.uniq.length != array.length
      2
    elsif array.all?((array[0])..(array[0] + array.length - 1))
      1
    else
      2
    end
  end 

  def validate_lets(coordinates)
    letters = []
    
    coordinates.each do |coordinate|
      letters << coordinate[0]
    end

    letters = letters.map do |let|
      let.ord
    end

    array_increments_by(letters)
  end

  def validate_nums(coordinates)
    numbers = []

    coordinates.each do |coordinate|
      numbers << coordinate.delete("A-Z")
    end

    numbers = numbers.map do |num|
      num.to_i
    end

    array_increments_by(numbers)
  end

  def check_coords(coordinates, length)
    valid_lets = validate_lets(coordinates)
    valid_nums = validate_nums(coordinates)
    valid = (coordinates.length == length) && (valid_lets + valid_nums == 1)
  end
end 