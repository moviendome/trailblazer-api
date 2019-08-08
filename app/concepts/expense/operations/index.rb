# frozen_string_literal: true

module Expense::Operations
  class Index < ApplicationOperation
    step :model!

    def model!(options, current_user:, **)
      options[:model] = current_user.expenses
    end
  end
end
