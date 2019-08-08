# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Trailblazer::Rails::Controller
  include ActionController::MimeResponds
end
