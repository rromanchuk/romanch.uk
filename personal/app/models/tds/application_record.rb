module Tds
  class ApplicationRecord < ::ApplicationRecord
    self.abstract_class = true

    connects_to database: { writing: :wx, reading: :wx }
  end
end