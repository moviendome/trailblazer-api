# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    resource = User.find_for_database_authentication(email: params[:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:password])
      sign_in(resource)
      return render json: {token: current_token}
    end

    invalid_login_attempt
  end

  private

  def respond_with(resource)
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end

  def current_token
    request.env["warden-jwt_auth.token"]
  end

  def invalid_login_attempt
    render json: {
      message: "Invalid credentials"
    }, status: :unauthorized
  end
end
