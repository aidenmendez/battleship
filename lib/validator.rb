

#### 
class Validator
    attr_reader :coordinates, :length 

    def initialize(coordinates, length)
        @coordinates = coordinates
        @length = length
    end 

    def length?()
        @length == @coordinates.length
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
    def in_range?(letters)
        invalid_letters = 0
        letter_range = ("A".."D").to_a           # this will be swapped to in order to upscale board

        letters.each do |letter|
            if !letter_range.include?(letter)
                invalid_letters += 1
            end 
        end 

        if invalid_letters > 0
            false
        else
            true
        end 
    end

    def validate_letters
        letters = []
        problems = 0
        letters = @coordinates.each do |coordinate|
            # coordinate is "A1"
            letters << coordinate[0]
        end 

        if !in_range?(letters) 
            problems += 1
        end


    end 
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