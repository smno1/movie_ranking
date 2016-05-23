require 'test_helper'

class Api::V1::RankControllerTest < ActionController::TestCase
  test "should get show_rank" do
    get :show_rank
    assert_response :success
  end

end
