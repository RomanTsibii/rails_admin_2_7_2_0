class CommentPolicy < ApplicationPolicy
  def create?
    user.can?(:comment, :create)
  end

  def update?
    user.can?(:comment, :update)
  end

  def destroy?
    user.can?(:comment, :destroy)
  end
end
