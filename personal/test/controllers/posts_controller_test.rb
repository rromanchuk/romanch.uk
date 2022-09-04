require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @me = users(:ryan)
    # Rails.application.config.action_dispatch.show_exceptions = true
  end

  test 'show unpublished post to me' do
    unpublished = posts(:unpublished)
    get post_url(unpublished), headers: { 'x-amzn-oidc-identity' => @me.cognito_id }
    assert_response :success
  end

  test 'hide unpublished post to guests' do
    unpublished = posts(:unpublished)

    assert_raises(ActionController::RoutingError) do
      get post_url(unpublished)
    end
  end

  test 'should show post' do
    get post_url(@post), headers: { 'x-amzn-oidc-identity' => @me.cognito_id }
    assert_response :success
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post), headers: { 'x-amzn-oidc-identity' => @me.cognito_id }
    end

    assert_redirected_to posts_path
  end

  test 'should update post' do
    patch post_url(@post), params: { post: { title: 'updated' } }, headers: { 'x-amzn-oidc-identity' => @me.cognito_id }

    # Reload association to fetch updated data and assert that title is updated.
    @post.reload
    assert_equal 'updated', @post.title
  end

  test 'should not update post' do
    patch post_url(@post), params: { post: { title: 'updated' } }

    assert_redirected_to login_path
  end
end
