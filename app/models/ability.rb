class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is?(:admin)
      can :manage, :all

    else
      can :destroy, Post do |post|
        post.author_id == user.id
      end
      can :destroy, Comment do |comment|
        comment.user_id == user.id
      end
      can :create, Post
      can :create, Comment
      can :create, Like

      can :read, :all
    end
  end
end
