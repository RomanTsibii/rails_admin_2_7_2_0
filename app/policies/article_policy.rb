class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.can?(:article, :new)
  end

  def create?
    user.can?(:article, :create)
  end

  def edit?
    user.can?(:article, :edit)
  end

  def update?
    user.can?(:article, :update)
  end

  def destroy?
    user.can?(:article, :destroy)
  end

  def view_modal?
    true
  end
end
