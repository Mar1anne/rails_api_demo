class UsersController < BaseController

  def_param_group :user do
    param :first_name, String, ''
    param :last_name, String, ''
    param :nickname, String, 'Must be unique', required: true, allow_nil: false
    param :email, String, '', required: true, allow_nil: false
  end

  def_param_group :user_password do
    param :password, String, '', required: true, allow_nil: false
    param :password_confirmation, String, 'Must match password parametar', required: true, allow_nil: false
  end

  api! 'A list of all users'
  param_group :pagination, BaseController

  def index
    super
  end

  api! 'Renders user info for given user_id'
  param :id, String, 'User id', required: true, allow_nil: false

  def show
    super
  end

  api! 'Creates a user'
  param_group :user
  param_group :user_password

  def create
    super
  end

  api! 'Updates a user'
  param_group :user
  param_group :user_password

  def update
    super
  end

  api! 'Deletes a user'
  param :id, String, 'User ID',required: true, allow_nil: false

  def destroy
    super
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
  end

  def query_params
    params.permit(:id, :nickname, :email)
  end
end
