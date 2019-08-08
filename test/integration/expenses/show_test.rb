# frozen_string_literal: true

require "test_helper"
require "devise/jwt/test_helpers"

class ExpensesShowTest < ActionDispatch::IntegrationTest
  def setup
    @user = Fabricate(:user)
    @expense = @user.expenses.first
  end

  test "should show user expense by id" do
    headers = {"Accept" => "application/json", "Content-Type" => "application/json"}
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, @user)

    get expense_path(@expense.id), headers: auth_headers
    assert_response :success
    assert_equal 200, response.status
    jdata = JSON.parse(response.body)
    assert_equal @expense.title, jdata["title"]
    assert_equal @expense.amount.to_f, jdata["amount"].to_f
    assert_equal Float, jdata["amount"].class
  end

  test "not found" do
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, @user)

    get expense_path("invalid-id"), headers: auth_headers
    assert_response :not_found
    assert_equal 404, response.status
  end
end
