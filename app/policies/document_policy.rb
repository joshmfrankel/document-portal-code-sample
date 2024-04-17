class DocumentPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope
        .where(uploader: user)
        .or(
          scope
            .where(uploader: user.creator)
        )
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

  def update?
    show? && record.uploader == user
  end

  def destroy?
    update?
  end
end
