# frozen_string_literal: true

require "test_helper"

module Expense::Operations
  class IndexTest < OperationTest
    before do
      @user = Fabricate(:user)
    end

    it "should list user expenses" do
      op = Expense::Operations::Index.(params: {}, current_user: @user)
      assert op.success?
      assert_equal 2, op[:model].count
    end
  end
end
