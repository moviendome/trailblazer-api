# frozen_string_literal: true

module User::Contracts
  class Create < ApplicationForm
    property :email
    property :password
    property :password_confirmation

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validation(name: :default, with: {form: true}) do
      configure do
        configure { config.messages_file = Rails.root.join("config", "locales", "dry.yml") }

        def unique?(value)
          User.where(email: value).empty?
        end
      end

      required(:email).filled(unique?: :email, format?: VALID_EMAIL_REGEX)
      required(:password).filled(min_size?: 6).confirmation
    end
  end
end
