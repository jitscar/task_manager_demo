class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can [:read, :update, :destroy], User, id: user.id
      can :manage, Task
      can :read, :all
    end
  end
end
