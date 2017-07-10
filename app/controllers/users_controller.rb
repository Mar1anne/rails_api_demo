class UsersController < BaseController

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

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
  end
end
