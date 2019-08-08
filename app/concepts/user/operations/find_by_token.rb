# frozen_string_literal: true

module User::Operations
  class FindByToken < ApplicationOperation
    step :set_user_id!
    step :set_model!

    def set_user_id!(options, token:, **)
      options["user_id"] = JWT.decode(token, Rails.application.secret_key_base).first["user_id"]
    end

    def set_model!(options, user_id:, **)
      options[:model] = User.find(user_id)
    end
  end
end
