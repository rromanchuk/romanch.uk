module RyanRomanchuk
  class ApplicationRecord < ::ApplicationRecord
    self.abstract_class = true

    connects_to database: { writing: :ryan_romanchuk, reading: :ryan_romanchuk }
  end
end