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
    @post = current_user.posts.build(post_params)
    if location_params && !location_params.empty?
      location = Location.new(location_params)
      raise InvalidRecordParameters.new('invalid_location_params', 'Invalid location parameters') unless location.valid?
      @post.location = Location.find_or_create_new(location)
    elsif current_user.location
      @post.location = current_user.location
    end

    if @post.save!
      render :create
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  api! 'Updates a post'
  param_group :post_info
  param_group :post

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update_attributes(post_params)
      if location_params && !location_params.empty?
        location = Location.new(location_params)
        raise InvalidRecordParameters.new('invalid_location_params', 'Invalid location parameters') unless location.valid?
        @post.location = Location.find_or_create_new(location)
      end
    end

    if @post.save!
      render :update
    else
      render json: @post.errors, status: :unprocessable_entity
    end

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
    params.permit(:user_id, :id, :title, :location_id)
  end
end
