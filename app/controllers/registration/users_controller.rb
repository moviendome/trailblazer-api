# frozen_string_literal: true

module Registration
  class UsersController < ApplicationController
    def create
      run User::Operations::Create do
        return render json: UserRepresenter.new(@model), status: :created
      end

      render json: {
        message: "Validation Failed",
        errors: @form.errors.messages
      }, status: :unprocessable_entity
    end
  end
end
