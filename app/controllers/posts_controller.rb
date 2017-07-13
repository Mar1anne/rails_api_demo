class PostsController < BaseController

  def_param_group :post_info do
    param :user_id, String, 'User ID', required: true, allow_nil: false
    param :id, String, 'Post ID', required: true, allow_nil: false
  end

  def_param_group :post do
    param :title, String, 'Title', required: true, allow_nil: false
    param :description, String, 'Description', required: true, allow_nil: false
  end

  api! 'Returns a list of all posts for the specified user_id'
  param :user_id, String, 'User ID', required: true, allow_nil: false
  param_group :pagination, BaseController

  def index
    super
  end

  api! 'Returns the information for the specified post'
  param_group :post_info

  def show
    super
  end

  api! 'Creates a new post'
  param :user_id, String, 'User ID', required: true, allow_nil: false
  param_group :post

  def create
    super
  end

  api! 'Updates a post'
  param_group :post_info
  param_group :post

  def update
    super
  end

  api! 'Deletes a post'
  param_group :post_info

  def destroy
    super
  end

  private

  def post_params
    params.permit(:title, :description, :user_id)
  end

  def query_params
    params.permit(:user_id, :id, :title)
  end
end
