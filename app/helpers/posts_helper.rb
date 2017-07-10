module PostsHelper
  def render_post(json, post)
    json.call(post, :id, :title, :description)
  end
end
