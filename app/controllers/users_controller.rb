class UsersController < BaseController

  # before_action authorize except sign in
  respond_to :json

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

  def index
    @users = User.all
  end

  api! 'Renders user info for given user_id'
  param :id, String, 'User id', required: true, allow_nil: false

  def show
    user = User.find_by_id(params[:id])
    raise NotFound.new('user_not_found', 'User not found!') if user.blank?
    render :show, locals: { user: user }
  end

  api! 'Creates a user'
  param_group :user
  param_group :user_password

  def create
    user = User.new user_params
    if user.save
      render :create, locals: { user: user }
    else
      raise InvalidRecord.new('invalid_record', 'Unable to save user')
    end
  end

  api! 'Updates a user'
  param_group :user
  param_group :user_password

  def update
    user = User.find_by_id(params[:id])
    raise NotFound.new('user_not_found', 'User not found!') if user.blank?
    # todo: Update user
    render :update, locals: { user: user }
  end

  api! 'Deletes a user'
  param :id, String, 'User ID',required: true, allow_nil: false
  
  def destroy
    user = User.find_by_id(params[:id])
    raise NotFound.new('user_not_found', 'User not found!') if user.blank?
    # todo: destroy user
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
  end
end
