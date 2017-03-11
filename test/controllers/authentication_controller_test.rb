require 'test_helper'

class AuthenticationControllerTest < ActionController::TestCase
  test "should get login_get" do
    get :login_get
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get signup_get" do
    get :signup_get
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
