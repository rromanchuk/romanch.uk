require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  setup do
    host! 'localhost'
    @post = posts(:one)
    Rails.application.config.action_dispatch.show_exceptions = true
  end
  
  test 'index' do
    unpublished = posts(:unpublished)
    get posts_url
    assert_response :success
    assert_not_includes(@controller.posts, unpublished)
  end

  test 'show unpublished post to me' do
    sign_in_as users(:ryan)
    unpublished = posts(:unpublished)
    get post_url(unpublished)
    assert_response :success
  end

  test 'hide unpublished post to guests' do
    unpublished = posts(:unpublished)
    get post_url(unpublished)
    assert_response :not_found
    # assert_raises(ActionController::RoutingError) do
    #   get post_url(unpublished)
    # end
  end

  test 'should show post' do
    sign_in_as users(:ryan)
    get post_url(@post)
    assert_response :success
    assert_not_empty(@controller.breadcrumbs)
  end

  test 'should destroy post' do
    sign_in_as users(:ryan)
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_path
  end

  test 'should update post' do
    sign_in_as users(:ryan)
    patch post_path(@post), params: { post: { title: 'updated' } }
    assert_response :redirect
    follow_redirect!
    #puts session[:user_id]

    # Reload association to fetch updated data and assert that title is updated.
    @post.reload
    assert_equal 'updated', @post.title
  end

  test 'should not update post' do
    patch post_url(@post), params: { post: { title: 'updated' } }

    assert_redirected_to page_path('who_dis')
  end
end
