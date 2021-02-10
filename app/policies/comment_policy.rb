class CommentPolicy < ApplicationPolicy
  def create?
    user.can?(:comment, :create)
  end

  def update?
    user.can?(:comment, :update) && comment_owner? || admin?
  end

  def destroy?
    user.can?(:comment, :destroy) && comment_owner? || admin?
  end

  private

  def comment_owner?
    user == record.commentable
  end
end
