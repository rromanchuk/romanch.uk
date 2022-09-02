module Pireps
  class RawReport < ApplicationRecord
    
    belongs_to :batch_file
  end
end