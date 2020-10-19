require "Minitest/autorun"
require "Minitest/pride"
require "./lib/user"
require "./lib/board"
require "./lib/cell"

class TestUser < Minitest::Test
  def setup
    @user = User.new()
  end

  def test_user_player_class_exists
    assert_instance_of User, @user
  end

  def test_user_had_board_when_instantiated
    assert_instance_of Board, @user.board
  end

end