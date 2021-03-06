class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == "admin"
      can :manage, :all
    elsif user.role == "member"
      can [:show, :update], User, id: user.id
      can :manage, PainEntry
      can :manage, TherapyEntry
      can :manage, DailyEntry
    else
      can :create, User
    end
  end
end
