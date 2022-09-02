module Pireps
  class RawReport < ApplicationRecord
    include Turbo::Broadcastable
    belongs_to :batch_file
  end
end