class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def edit?
    update?
  end

  def update?
    @user.admin? || @user == record.user
  end

  def destroy?
    @user.admin? || @user == record.user
  end
end
