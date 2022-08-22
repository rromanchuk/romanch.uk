class RomanchukOpen::Golfer < ApplicationRecord
  belongs_to :player
  belongs_to :tournament
  delegate :name, to: :player
end
