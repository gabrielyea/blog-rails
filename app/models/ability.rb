class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    can :manage, Post, author: user
    can :manage, Comment, author: user

    return unless user.is? :admin

    can :manage, :all
  end
end
