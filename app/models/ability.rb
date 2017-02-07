class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :read, Source
    can [:create, :update, :destroy], Source do |source|
      source.user == user
    end
  end
end
