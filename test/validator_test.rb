require "Minitest/autorun"
require "Minitest/pride"
require "./lib/validator"

class ValidatorTest < Minitest::Test 
    def test_it_exists
        coordinates = ["A1", "A2", "A3"]
        validator = Validator.new(coordinates, 3)

        assert_instance_of Validator, validator
        assert_equal 3, validator.length
        assert_equal coordinates, validator.coordinates
    end

    def test_length_method
        coordinates = ["A1", "A2", "A3"]
        validator = Validator.new(coordinates, 3)
        validator2 = Validator.new(coordinates, 2)

        assert validator.length?
        assert_equal false, validator2.length?
    end 

    
end 