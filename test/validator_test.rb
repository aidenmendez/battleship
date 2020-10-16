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

  def test_letter_validator_works
      coordinates = ["A1", "A2", "A3"]
      coordinates2 = ["A2", "A3", "B1"]
      validator = Validator.new(coordinates, 3)
      validator2 = Validator.new(coordinates2, 3)

      assert_equal 0, validator.validate_lets
      assert_equal 2, validator2.validate_lets
  end

  def test_number_validation
    coordinates = ["A1", "A2", "A3"]
    coordinates2 = ["A2", "A3", "B1"]
    validator = Validator.new(coordinates, 3)
    validator2 = Validator.new(coordinates2, 3)

    assert_equal 1, validator.validate_nums
    assert_equal 2, validator2.validate_nums
  end

  def test_check_coords
    coordinates = ["A1", "A2", "A3"]
    coordinates2 = ["A2", "A3", "B1"]
    validator = Validator.new(coordinates, 3)
    validator2 = Validator.new(coordinates2, 3)

    assert_equal true, validator.check_coords
    assert_equal false, validator2.check_coords
  end

    
end 