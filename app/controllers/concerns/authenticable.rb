module Authenticable
  def current_user
    @current_user ||= User.find_by_access_token(current_access_token)
    raise UnauthorizedRequest.new(nil, 'User access_token is invalid!') if @current_user.blank?
    @current_user
  end

  # Authentication
  def current_access_token
    access_token = request.headers['HTTP_ACCESS_TOKEN']
    raise MissingHeaderParam.new('missing_access_token') if access_token.blank?
    access_token
  end

  def authenticate_user_with_token!
    current_user
  end
end