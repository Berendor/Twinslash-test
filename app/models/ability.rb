# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new :role => 'unlogged'
    can :read, Advertising

    if user.role == 'user'  # additional permissions for logged in users (they can read their own posts)
      can :read, Advertising, user_id: user.id
      can :read, User
      can :update, Advertising
      can :create, Advertising
      can :destroy, Advertising
      can :edit, Advertising
      cannot :create, User
      cannot :create, AdvertisingsType
    end

    if user.role == 'admin'  # additional permissions for administrators
      can :manage, :all
      can :read, Advertising
      can :create, User
      can :create, AdvertisingsType
      cannot :create, Advertising
    end
  end
end
