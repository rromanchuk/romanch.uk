module RyanRomanchuk
  class User < ApplicationRecord
    has_secure_password
    has_many :sessions, dependent: :destroy

    normalizes :email_address, with: ->(e) { e.strip.downcase }

    def me?
      return true if Rails.env.development?
      # %w[54467d4a-f7bc-457d-aa72-55842106b02e f6fc595b-394c-4b56-8991-ded80c12d285].include?(cognito_id)
      false
    end
  end
end
