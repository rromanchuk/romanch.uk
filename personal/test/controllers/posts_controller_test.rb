require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include SignInHelper
  setup do
    @post = posts(:one)
    @me = users(:ryan)
    # Rails.application.config.action_dispatch.show_exceptions = true
  end

  test 'show unpublished post to me' do
    sign_in_as(@me)
    unpublished = posts(:unpublished)
    get post_url(unpublished)
    assert_response :success
  end

  test 'hide unpublished post to guests' do
    unpublished = posts(:unpublished)

    assert_raises(ActionController::RoutingError) do
      get post_url(unpublished)
    end
  end

  test 'should show post' do
    sign_in_as(@me)
    get post_url(@post)
    assert_response :success
  end

  test 'should destroy post' do
    sign_in_as(@me)
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_path
  end

  test 'should update post' do
    sign_in_as(@me)
    patch post_url(@post), params: { post: { title: 'updated' } }

    # Reload association to fetch updated data and assert that title is updated.
    @post.reload
    assert_equal 'updated', @post.title
  end

  test 'should not update post' do
    patch post_url(@post), params: { post: { title: 'updated' } }

    assert_redirected_to login_path
  end
end
