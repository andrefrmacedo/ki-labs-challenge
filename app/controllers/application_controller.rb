# frozen_string_literal: true

class ApplicationController < ActionController::API
  def error_message(message)
    {
      error: message
    }
  end
end
