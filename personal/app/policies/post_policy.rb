class PostPolicy < ApplicationPolicy
  # See https://actionpolicy.evilmartians.io/#/writing_policies
  #
  def index?
    true
  end
  
  def update?
    me?
  end

  def show?
    me?
  end

  def show?
    me?
  end

  def create?
    me?
  end

  # Scoping
  # See https://actionpolicy.evilmartians.io/#/scoping
  #
  relation_scope do |relation|
    next relation if me?
    relation.published
  end
end
