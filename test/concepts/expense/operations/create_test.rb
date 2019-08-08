# frozen_string_literal: true

require "test_helper"

module Expense::Operations
  class CreateTest < OperationTest
    before do
      @user = Fabricate(:user)
    end

    it "should create an expense" do
      op = Expense::Operations::Create.(
        params: {
          title: "Coffee",
          amount: "100",
      }, current_user: @user)

      assert op[:model].persisted?
      assert "Coffee", op[:model].title
    end

   it "should not create an expense without amount" do
      op = Expense::Operations::Create.(
        params: {
          title: "Coffee",
      }, current_user: @user)

      assert op.failure?
      refute op[:model].persisted?
      assert op["contract.default"].errors[:amount].any?
    end
  end
end
