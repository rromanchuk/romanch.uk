module RomanchukOpen
  class GolferPolicy < ApplicationPolicy
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
end
