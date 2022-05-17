class HomePolicy < ApplicationPolicy

  def status?
    true
  end

  def index?
    true
  end

end
