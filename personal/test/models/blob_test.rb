require 'test_helper'

class BlobTest < ActiveSupport::TestCase
  test 'sanity' do
    assert_nothing_raised do
      blobs(:image)
    end
  end
end
