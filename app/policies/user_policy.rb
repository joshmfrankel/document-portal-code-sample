class UserPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.where(creator: user)
    end

    private

    attr_reader :user, :scope
  end

  def index?
    user.teacher?
  end

  def create?
    index?
  end

  def show?
    Pundit.policy_scope!(user, User).exists?(record.id)
  end

  def update?
    show?
  end

  def destroy?
    update?
  end
end
