class UsersController < BaseController
  
  def_param_group :user do
    param :first_name, String
    param :last_name, String
    param :nickname, String, 'Must be unique', allow_nil: false
    param :email, String, allow_nil: false
  end

  def_param_group :user_password do
    param :password, String, allow_nil: false
    param :password_confirmation, String, 'Must match password parametar', allow_nil: false
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
    @user = User.new user_params

    if location_params && !location_params.empty?
      location = Location.new location_params
      raise InvalidRecordParameters.new('invalid_location_params', 'Invalid location parameters') unless location.valid?
      @user.location = Location.find_or_create_new(location)
    end

    @user.save!
  end

  api! 'Updates a user'
  param_group :user
  param_group :user_password

  def update
    if @current_user.update(user_params)
      if location_params && !location_params.empty?
        location = Location.new(location_params)
        raise InvalidRecordParameters.new('invalid_location_params', 'Invalid location parameters') unless location.valid?
        @current_user.location = Location.find_or_create_new(location)
        @current_user.save!
      end
      render :update
    else
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end

  api! 'Deletes a user'
  param :id, String, 'User ID',required: true, allow_nil: false

  def destroy
    @current_user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
  end

  def query_params
    params.permit(:id, :nickname, :email, :location_id)
  end
end

