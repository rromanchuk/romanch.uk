require "test_helper"

class BlobTest < ActiveSupport::TestCase
  test "the truth" do
    assert_nothing_raised {
      blobs(:image)
    }    
  end
end
