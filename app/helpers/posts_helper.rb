module PostsHelper
  def render_post(json, post)
    json.call(post, :id, :title, :description, :location)
  end
end
