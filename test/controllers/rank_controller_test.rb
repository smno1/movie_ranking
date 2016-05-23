require 'test_helper'

class RankControllerTest < ActionController::TestCase
  test "should get show_rank" do
    get :show_rank
    assert_response :success
  end

  test "should get film_screens" do
    get :film_screens
    assert_response :success
  end

end
