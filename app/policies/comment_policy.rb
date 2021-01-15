class CommentPolicy < ApplicationPolicy
  def create?
    user.can?(:comment, :create)
  end
end
