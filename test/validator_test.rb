require "Minitest/autorun"
require "Minitest/pride"
require "./lib/validator"

class ValidatorTest < Minitest::Test 
    def test_it_exists
        validator = Validator.new(["A1", "A2", "A3"], 3)

        assert_instance_of Validator, validator
    end
end 