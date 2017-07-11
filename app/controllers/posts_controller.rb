class PostsController < BaseController
  respond_to :json

  def_param_group :post_info do
    param :user_id, String, 'User ID', required: true, allow_nil: false
    param :id, String, 'Post ID', required: true, allow_nil: false
  end

  def_param_group :post do
    param :title, String, 'Title', required: true, allow_nil: false
    param :description, String, 'Description', required: true, allow_nil: false
  end

  api! 'Returns a list of all posts for the specified user_id'
  param_group :post_info

  def index
    @posts = Post.all
  end

  api! 'Returns the information for the specified post'
  param_group :post_info

  def show
    post = Post.find(params[:id])
    raise NotFound.new('post_not_found', 'Post not found!') if post.blank?
    render :show, locals: { post: post }
  end

  api! 'Creates a new post'
  param_group :post_info
  param_group :post

  def create

  end

  api! 'Updates a post'
  param_group :post_info
  param_group :post

  def update

  end

  api! 'Deletes a post'
  param_group :post_info

  def destroy

  end
end
