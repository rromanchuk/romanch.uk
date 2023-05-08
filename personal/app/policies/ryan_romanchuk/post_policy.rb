module RyanRomanchuk
  class PostPolicy < ApplicationPolicy
    # See https://actionpolicy.evilmartians.io/#/writing_policies
    #
    def index?
      true
    end
    
    def show?
      allow! if me?
      
      check?(:published?)
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

    def destroy?
      me?
    end

    def edit?
      me?
    end

    def published?
      details[:not_found] = true
      record.published?
    end

    # Scoping
    # See https://actionpolicy.evilmartians.io/#/scoping
    #
    relation_scope do |relation|
      next relation if me?
      relation.published
    end

  end
end