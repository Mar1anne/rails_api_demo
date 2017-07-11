class BaseController < ApplicationController
  include ApiError

  resource_description do
    api_version '1.0'
  end

  def_param_group :pagination do
    param :page, String
    param :per_page, String
  end

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
