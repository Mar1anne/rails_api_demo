module UsersHelper
  def render_user(json, user)
    json.call(user, :id, :first_name, :last_name, :nickname, :created_at)
  end

  def render_new_user(json, user)
    render_user(json, user)
    json.access_token user.access_token
  end
end
