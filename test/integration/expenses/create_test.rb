# frozen_string_literal: true

require "test_helper"
require "devise/jwt/test_helpers"

class ExpensesCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user = Fabricate(:user)
  end

  test "create expense" do
    headers = {"Accept" => "application/json", "Content-Type" => "application/json"}
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, @user)

    expense = {title: "Coffee", amount: "85"}.to_json
    post expenses_path, params: expense, headers: auth_headers
    assert_response :success
    jdata = JSON.parse(response.body)
    assert_equal "Coffee", jdata["title"]
  end

  test "invalid amount" do
    headers = {"Accept" => "application/json", "Content-Type" => "application/json"}
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, @user)

    expense = {title: "Coffee"}.to_json
    post expenses_path, params: expense, headers: auth_headers
    assert_response :unprocessable_entity
    jdata = JSON.parse(response.body)
    assert_equal "Validation Failed", jdata["message"]
    assert jdata["errors"].any?
  end
end
