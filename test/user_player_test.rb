require "Minitest/autorun"
require "Minitest/pride"
require "./lib/user_player"

class TestUserPlayer < Minitest::Test
  def setup
    @user = UserPlayer.new()
  end

  def test_user_player_class_exists
    assert_instance_of UserPlayer, @user
  end


end