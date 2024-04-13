class DocumentPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.where(uploader: user)
    end

    private

    attr_reader :user, :scope
  end

  def index?
    true
  end

  def create?
    user.teacher?
  end

  def show?
    Pundit.policy_scope!(user, Document).exists?(record.id)
  end

  def edit?
    show?
  end

  def update?
    edit?
  end

  def destroy?
    update?
  end
end
