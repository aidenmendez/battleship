require "Minitest/autorun"
require "Minitest/pride"
require "./lib/board"
require "./lib/cell"

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end
  def test_it_exists
    assert_instance_of Board, @board
  end
end