class UserPolicy < ApplicationPolicy
  def index?
    me?
  end

  def create?
    me?
  end

  def update?
    me?
  end

  def me?
    me?
  end

  # Scoping
  # See https://actionpolicy.evilmartians.io/#/scoping
  #
  # relation_scope do |relation|
  #   next relation if user.admin?
  #   relation.where(user: user)
  # end
end
