

#### 
class Validator
    attr_reader :coordinates, :length 

    def initialize(coordinates, length)
        @coordinates = coordinates
        @length = length
        @acceptable_coords = cells = [
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

    def acceptable_coords?
        thing_to_return = true
        @coordinates.each do |coordinate|
          if @acceptable_coords.include?(coordinate)
          else
            thing_to_return = false
          end
        end
        thing_to_return
    end

    def validate_letters
        letters = []
    
        @coordinates.each do |coordinate|
          # coordinate is "A1"
          letters << coordinate[0]
        end
        if letters.all? {|letter| letter == letters[0]}
          "vertical"
        elsif letters.all?((letters[0].ord)..(letters[0].ord + @length - 1))
          "horizontal"
        else
          nil
        end
    
    end

    def validate_numbers
        numbers = []
    
        @coordinates.each do |coordinate|
          # coordinate is "A1"
          numbers << coordinate.delete("A-Z")
        end
        if numbers.all? {|number| number == numbers[0]}
          "horizontal"
        elsif numbers.all?((numbers[0].to_i..(numbers[0].to_i + @length - 1)))
          "vertical"
        else
          nil
        end
    
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
    # def in_range?(letters)
    #     invalid_letters = 0
    #     letter_range = ("A".."D").to_a           # this will be swapped to in order to upscale board

    #     letters.each do |letter|
    #         if !letter_range.include?(letter)
    #             invalid_letters += 1
    #         end 
    #     end 

    #     if invalid_letters > 0
    #         false
    #     else
    #         true
    #     end 
    # end

    # def validate_letters
    #     letters = []
    #     problems = 0
    #     letters = @coordinates.each do |coordinate|
    #         # coordinate is "A1"
    #         letters << coordinate[0]
    #     end 

    #     if !in_range?(letters) 
    #         problems += 1
    #     end


    # end 
    # 
    # number_validator that takes a coord []
    #   number_validator extracts numbers into []
    #       check range of number []
    #       check numbers are all same or all incremental
    #           if !same, check incremental by 1 only
    #                   use each_cons()
    #                   if arr[0].each_cons(arr.length) == arr
    #                     return :horizontal = true
    #       return a symbol, either :horizontal (same) or :vertical (incremental)
    #           if same, :horizontal
    #           if not same, :vertical
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
    # 
    # 
    







end 