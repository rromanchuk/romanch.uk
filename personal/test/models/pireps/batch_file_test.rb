require "test_helper"

module Pireps
  class BatchFileTest < ActiveSupport::TestCase
    test "sanity" do
      assert_nothing_raised { 
        pireps_batch_files(:first)
      }
    end
  end
end