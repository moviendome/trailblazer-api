# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  private

  def _run_options(options)
    options.merge(current_user: current_user)
  end

  def current_user
    op = User::Operations::FindByToken.(token: token)
    op[:model] if op.success?
  end

  def token
    request.headers["Authorization"].split(" ").last
  end
end
