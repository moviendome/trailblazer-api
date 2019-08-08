# frozen_string_literal: true

require "test_helper"

class UserRegistrationTest < ActionDispatch::IntegrationTest
  test "register valid user" do
    valid_user = {
      email: Faker::Internet.email,
      password: "123456",
      password_confirmation: "123456"
    }

    post signup_path, params: valid_user
    assert_response :created

    jdata = JSON.parse(response.body)

    assert_equal valid_user[:email], jdata["email"]
  end

  test "invalid user" do
    post signup_path, params: {email: ""}
    assert_response :unprocessable_entity

    jdata = JSON.parse(response.body)
    assert_equal "Validation Failed", jdata["message"]
    assert jdata["errors"].any?
  end
end
