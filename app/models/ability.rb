class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all
    can :create, Post

    can :update, Post do |p|
      p.user_id == user.id
    end

    can :destroy, Post do |p|
      p.user_id == user.id
    end

    can :update, User do |u|
      user.id == u.id
    end

    can :destroy, User do |u|
      user.id = u.id
    end
  end
end
