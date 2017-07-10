class BaseController < ApplicationController
  include ApiError


  # Error Handling
  rescue_from(Error) { |e| handle_error(e) }

  private

  def handle_error(error)
    return unless error.is_a?(Error)
    respond_to do |format|
      format.json { render json: { error: error.error, message: error.message }, status: error.status }
    end
  end
end
