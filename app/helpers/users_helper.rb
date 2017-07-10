module UsersHelper
  def render_user(json, user)
    json.call(user, :id, :first_name, :last_name, :nickname, :created_at)
  end
end
