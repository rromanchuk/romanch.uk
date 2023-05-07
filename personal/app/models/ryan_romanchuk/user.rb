module RyanRomanchuk
  class User < ApplicationRecord
    include Sluggable
  
    store_accessor :data, :name
  
    def slug_candidates = [:username]
  
    def me?
      %w[54467d4a-f7bc-457d-aa72-55842106b02e f6fc595b-394c-4b56-8991-ded80c12d285].include?(cognito_id)
    end
  end
end