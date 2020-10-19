require "Minitest/autorun"
require "Minitest/pride"
require "./lib/board"
require "./lib/computer"

class ComputerTest < Minitest::Test 
  
  def test_computer_exists
    computer = Computer.new

    assert computer
  end 
end 