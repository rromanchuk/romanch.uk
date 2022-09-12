require 'test_helper'
module Serve
  class VideosControllerTest < ActionDispatch::IntegrationTest
    setup do
      @video = blobs(:video)
    end

    test 'show' do
      get serve_video_url(@video.slug)
      assert_response :success
      assert_select 'title'
    end
  end
end
