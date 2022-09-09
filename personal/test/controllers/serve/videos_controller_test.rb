require 'test_helper'
module Serve
  class VideosControllerTest
    setup do
      @video = blobs(:video)
    end

    test 'show' do
      get serve_video_url(@video)
      assert_response :success
    end
  end
end
