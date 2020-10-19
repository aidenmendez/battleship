require "./lib/board"

class Computer

  # This method takes a board, and a number of coordinates, and randomly returns valid adjacent coordinates (".") in an array
  def random_coordinates(board, number_coordinates)
    last_square = board.cells.keys.sort[-1]
    max_letter = last_square[0]
    max_number = last_square[1..-1].to_i
    horizontal_ship = [true, false].sample
    random_coordinates = []

    if horizontal_ship
      starting_letter = rand(65..max_letter.ord).chr
      starting_number = rand(1..(max_number + 1 - number_coordinates))

      number_coordinates.times do 
        random_coordinates << starting_letter + starting_number.to_s
        starting_number += 1
      end
    else
      starting_letter = rand(65..max_letter.ord + 1 - number_coordinates).chr
      starting_number = rand(1..max_number)

      number_coordinates.times do 
        random_coordinates << starting_letter + starting_number.to_s
        
        starting_letter = (starting_letter.ord + 1).chr
      end 
    end

    random_coordinates
  end 


  
end 