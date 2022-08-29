class AssetPolicy < ApplicationPolicy
  def index?
    me?
  end

  def update?
    me?
  end

  def new?
    me?
  end

  def create?
    me?
  end

  def edit?
    me?
  end

  def destroy?
    me?
  end
end
