# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, Advertising
    elsif user.role == 'admin'
      can :read, Advertising
      can :manage, AdvertisingsType
      can :manage, User
    else
      can :read, User
      can [:read, :create], Advertising
      can [:update, :destroy], Advertising, :user_id => user.id
    end
  end
end
