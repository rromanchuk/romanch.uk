module Wx
  class BatchPolicy < ApplicationPolicy
    def ingest?
      me?
    end
  end
end
