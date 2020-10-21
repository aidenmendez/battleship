require "Minitest/autorun"
require "Minitest/pride"
require "./lib/validator"
require "./lib/cell"

class ValidatorTest < Minitest::Test 
  def test_it_exists
      coordinates = ["A1", "A2", "A3"]
      validator = Validator.new()

      assert_instance_of Validator, validator
  end

  def test_letter_validation
      coordinates = ["A1", "A2", "A3"]
      coordinates2 = ["A2", "A3", "B1"]
      coordinates3 = ["A1", "B1", "C1"]

      validator = Validator.new

      assert_equal 0, validator.validate_lets(coordinates)
      assert_equal 2, validator.validate_lets(coordinates2)
      assert_equal 1, validator.validate_lets(coordinates3)
  end

  def test_number_validation
    coordinates = ["A1", "A2", "A3"]
    coordinates2 = ["A2", "A3", "B1"]
    coordinates3 = ["A1", "B1", "C1"]

    validator = Validator.new

    assert_equal 1, validator.validate_nums(coordinates)
    assert_equal 2, validator.validate_nums(coordinates2)
    assert_equal 0, validator.validate_nums(coordinates3)
  end

  def test_check_coords
    coordinates = ["A1", "A2", "A3"]
    coordinates2 = ["A2", "A3", "B1"]

    validator = Validator.new

    assert_equal true, validator.check_coords(coordinates, 3)
    assert_equal false, validator.check_coords(coordinates2, 3)
  end

  def test_array_increments_by
    coordinates = ["A1", "A2", "A3"]

    validator = Validator.new
    
    assert_equal 1, validator.array_increments_by([1, 2, 3])
    assert_equal 0, validator.array_increments_by([1, 1, 1])
    assert_equal 2, validator.array_increments_by([1, 1, 2])
    assert_equal 2, validator.array_increments_by([1, 2, 4])
  end 
end 