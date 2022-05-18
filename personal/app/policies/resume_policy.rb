class ResumePolicy < ApplicationPolicy

  def index?
    true
  end

  def download?
    user.present?
  end
end
