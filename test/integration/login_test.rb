# frozen_string_literal: true

require "test_helper"

class LoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = Fabricate(:user)
  end

  test "successful login & valid token" do
    post new_user_session_path, params: {email: @user.email, password: @user.password}
    assert_response :success
    assert response.headers["Authorization"]
  end

  test "invalid login & no jwt token" do
    post new_user_session_path, params: {email: "", password: ""}
    assert_response :unauthorized
    assert_nil response.headers["Authorization"]
    jdata = JSON.parse(response.body)
    assert_equal "Invalid credentials", jdata["message"]
  end
end
