# frozen_string_literal: true

require "test_helper"

module Expense::Operations
  class ShowTest < OperationTest
    before do
      @user = Fabricate(:user)
      @expense = @user.expenses.first
    end

    it "should show an expense by id" do
      op = Expense::Operations::Show.(params: { id: @expense.id }, current_user: @user)
      assert op.success?
      assert_equal @expense.title, op[:model].title
    end

    it "should not show an invalid expense by id" do
      op = Expense::Operations::Show.(params: { id: "invalid-id" }, current_user: @user)
      assert op.failure?
    end
  end
end
