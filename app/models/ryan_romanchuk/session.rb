module RyanRomanchuk
  class Session < ApplicationRecord
    belongs_to :user
  end
end
