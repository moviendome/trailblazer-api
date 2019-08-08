# frozen_string_literal: true

module Expense::Contracts
  class Create < ApplicationForm
    property :user_id
    property :title
    property :amount

    validation(name: :default, with: {form: true}) do
      configure do
        configure { config.messages_file = Rails.root.join("config", "locales", "dry.yml") }

        def greater_than_zero?(value)
          value.to_f.positive?
        end
      end

      # TODO: user_id?
      required(:title).filled
      required(:amount).filled(:greater_than_zero?)
    end
  end
end
