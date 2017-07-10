class UsersController < BaseController

  # before_action authorize except sign in
  respond_to :json

  def show
    user = User.find_by_id(params[:id])
    raise NotFound.new('user_not_found', 'User not found!') if user.blank?
    render :show, locals: { user: user }
  end

  def index
    @users = User.all
  end

  def create
    user = User.new user_params
    if user.save
      render :create, locals: { user: user }
    else
      raise InvalidRecord.new('invalid_record', 'Unable to save user')
    end
  end

  def update
    user = User.find_by_id(params[:id])
    raise NotFound.new('user_not_found', 'User not found!') if user.blank?
    render :update, locals: { user: user }
  end

  def destroy
    user = User.find_by_id(params[:id])
    raise NotFound.new('user_not_found', 'User not found!') if user.blank?
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
  end
end
