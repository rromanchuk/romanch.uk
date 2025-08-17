module Searchable
  extend ActiveSupport::Concern

  included do
    include PgSearch::Model
    multisearchable against: search_against
  end

  class_methods do
    def search_against
      const_defined?(:SEARCH_AGAINST) ? const_get(:SEARCH_AGAINST) : []
    end
  end
end