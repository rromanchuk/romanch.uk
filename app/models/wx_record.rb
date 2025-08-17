class WxRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :wx }
end