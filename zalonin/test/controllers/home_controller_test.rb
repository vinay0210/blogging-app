require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get blog" do
    get :blog
    assert_response :success
  end

  test "should get zalonin" do
    get :zalonin
    assert_response :success
  end

end
