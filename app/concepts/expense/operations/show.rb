# frozen_string_literal: true

module Expense::Operations
  class Show < ApplicationOperation
    step :model!

    def model!(options, current_user:, params:, **)
      options[:model] = current_user.expenses.find_by(id: params[:id])
    end
  end
end
