module Pireps
  class BatchFilePolicy < ApplicationPolicy
    def ingest?
      me?
    end
  end
end
