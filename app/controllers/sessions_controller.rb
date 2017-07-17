class SessionsController < BaseController

  skip_before_action :authenticate_user_with_token!, only: [:create]
  skip_before_action :set_resource

  def create
    @user = User.find_by_email(user_params[:email])

    if @user && @user.valid_password?(user_params[:password])
      login_user!
      render :'sessions/create', status: :created
    else
      render json: { message: 'Wrong email / password' }, status: :bad_request
    end

  end

  def destroy
    debugger
    @current_user.invalidate_access_token
    @current_user.save
    head 204
  end
  
  private
  
  def user_params
    params.permit(:email, :password)
  end

  private

  def login_user!
    @user.generate_access_token
    @user.save!
  end
end
