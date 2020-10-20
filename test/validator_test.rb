require "Minitest/autorun"
require "Minitest/pride"
require "./lib/validator"
require "./lib/cell"

class ValidatorTest < Minitest::Test 
  def test_it_exists_zzz
      coordinates = ["A1", "A2", "A3"]
      validator = Validator.new()

      assert_instance_of Validator, validator
      # assert validator.length?(coordinates, 3)
  end

  # def test_length_method_zzz
  #     coordinates = ["A1", "A2", "A3"]
  #     validator = Validator.new()
      

  #     assert validator.length?(coordinates, 3)
  #     assert_equal false, validator.length?(coordinates, 2)
  # end 

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
    validator = Validator.new
    # cells = {
    #   "A1" => Cell.new("a1"),
    #   "A2" => Cell.new("a2"),
    #   "A3" => Cell.new("a3"),
    #   "A4" => Cell.new("a4"),
    #   "B1" => Cell.new("B1"),
    #   "B2" => Cell.new("B2"),
    #   "B3" => Cell.new("B3"),
    #   "B4" => Cell.new("B4"),
    #   "C1" => Cell.new("C1"),
    #   "C2" => Cell.new("C2"),
    #   "C3" => Cell.new("C3"),
    #   "C4" => Cell.new("C4"),
    #   "D1" => Cell.new("D1"),
    #   "D2" => Cell.new("D2"),
    #   "D3" => Cell.new("D3"),
    #   "D4" => Cell.new("D4")
    # }

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