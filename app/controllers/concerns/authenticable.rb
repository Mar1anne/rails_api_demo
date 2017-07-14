module Authenticable
  def current_user
    @current_user ||= User.find_by(access_token: request.headers['HTTP_ACCESS_TOKEN'])
    debugger
  end

  def authenticate_user!
    render json: { message: 'Unauthorized' }, status: :unauthorized unless current_user.present?
  end
end