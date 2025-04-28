module RyanRomanchuk
  class User < ApplicationRecord
    has_secure_password
    has_many :sessions, dependent: :destroy

    normalizes :email_address, with: ->(e) { e.strip.downcase }

    def me?
      return true if Rails.env.development?
      id == "248b84ea-063a-48b8-93d2-895069be56d1"
    end
  end
end
