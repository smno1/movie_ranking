require 'test_helper'

class Api::V1::ScreenControllerTest < ActionController::TestCase
  test "should get screen_preference" do
    get :screen_preference
    assert_response :success
  end

end
