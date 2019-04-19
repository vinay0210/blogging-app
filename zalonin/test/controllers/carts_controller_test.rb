require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  test "should get status" do
    get :status
    assert_response :success
  end

end
