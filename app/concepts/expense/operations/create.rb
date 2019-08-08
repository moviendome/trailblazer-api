# frozen_string_literal: true

module Expense::Operations
  class Create < ApplicationOperation
    step :setup_model!
    step Contract::Build(constant: Expense::Contracts::Create)
    step Contract::Validate()
    step Contract::Persist()

    def setup_model!(options, current_user:, **)
      options[:model] = current_user.expenses.build
    end
  end

end
