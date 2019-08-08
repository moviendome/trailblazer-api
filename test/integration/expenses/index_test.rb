# frozen_string_literal: true

require "test_helper"
require "devise/jwt/test_helpers"

class ExpensesIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = Fabricate(:user)
  end

  test "list user expenses" do
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, @user)

    get expenses_path, headers: auth_headers
    assert_response :success
    assert_equal 200, response.status
    jdata = JSON.parse(response.body)
    assert_equal 2, jdata.count
  end
end
