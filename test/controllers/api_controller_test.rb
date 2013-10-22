require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get signal" do
    get :signal
    assert_response :success
  end

end
