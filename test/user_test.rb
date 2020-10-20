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

  def test_user_has_board_when_instantiated
    @user.setup
    assert_instance_of Board, @user.board
  end

  def test_shot_at_works
    skip
    # skipped due to cli
    assert_equal false, @user.board.cells["A1"].fired_upon?
    
    @user.shot_at("A1")

    assert @user.board.cells["A1"].fired_upon?
  end 

  def test_shot_result_works
    skip
    # skipped due to cli
    @user.shot_at("A1")

    assert_equal "miss", @user.shot_result("A1")
  end 
end