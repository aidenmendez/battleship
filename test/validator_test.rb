require "Minitest/autorun"
require "Minitest/pride"
require "./lib/validator"

class ValidatorTest < Minitest::Test 
  def test_it_exists_zzz
      coordinates = ["A1", "A2", "A3"]
      validator = Validator.new()

      assert_instance_of Validator, validator
      assert validator.length?(coordinates, 3)
  end

  def test_length_method_zzz
      coordinates = ["A1", "A2", "A3"]
      validator = Validator.new()
      

      assert validator.length?(coordinates, 3)
      assert_equal false, validator.length?(coordinates, 2)
  end 

  def test_letter_validator_works_zzz
      coordinates = ["A1", "A2", "A3"]
      coordinates2 = ["A2", "A3", "B1"]
      validator = Validator.new()

      assert_equal 0, validator.validate_lets(coordinates)
      assert_equal 2, validator.validate_lets(coordinates2)
  end

  def test_number_validation_zzz
    coordinates = ["A1", "A2", "A3"]
    coordinates2 = ["A2", "A3", "B1"]
    validator = Validator.new()

    assert_equal 1, validator.validate_nums(coordinates)
    assert_equal 2, validator.validate_nums(coordinates2)
  end

  def test_check_coords_zzz
    coordinates = ["A1", "A2", "A3"]
    coordinates2 = ["A2", "A3", "B1"]
    validator = Validator.new()

    assert_equal true, validator.check_coords(coordinates, 3)
    assert_equal false, validator.check_coords(coordinates2, 3)
  end

  def test_array_checker_zzz
    coordinates = ["A1", "A2", "A3"]
    validator = Validator.new()
    
    assert_equal 1, validator.array_checker([1, 2, 3])
    assert_equal 0, validator.array_checker([1, 1, 1])
    assert_equal 2, validator.array_checker([1, 1, 2])
    assert_equal 2, validator.array_checker([1, 2, 4])
  end 
end 