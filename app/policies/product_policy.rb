class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.has_role?(:admin)
  end

  def update?
    user.has_role?(:admin) || user.has_role?(:moderator)
  end

  def destroy?
    user.has_role?(:admin)
  end





end