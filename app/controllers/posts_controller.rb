class PostsController < BaseController
  respond_to :json

  def index
    @posts = Post.all
  end

  def show
    post = Post.find(params[:id])
    raise NotFound.new('post_not_found', 'Post not found!') if post.blank?
    render :show, locals: { post: post }
  end

  def create

  end

  def update

  end

  def destroy

  end
end
