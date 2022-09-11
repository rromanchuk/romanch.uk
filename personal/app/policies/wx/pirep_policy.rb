module Wx
  class PirepPolicy < ApplicationPolicy
    def create?
      me?
    end

    def destroy?
      me?
    end

    def update?
      me?
    end
  end
end
