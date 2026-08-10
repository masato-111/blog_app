require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index without signing in" do
    get posts_url
    assert_response :success
  end

  test "should require sign in to view a post" do
    get post_url(posts(:one))
    assert_redirected_to new_user_session_url
  end

  test "should show a post when signed in" do
    sign_in users(:one)

    get post_url(posts(:one))
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)

    get new_post_url
    assert_response :success
  end

  test "should create post with valid params" do
    sign_in users(:one)

    assert_difference("Post.count", 1) do
      post posts_url, params: { post: { title: "新しい投稿", description: "本文" } }
    end
    assert_redirected_to posts_url
  end

  test "should not create post without a title" do
    sign_in users(:one)

    assert_no_difference("Post.count") do
      post posts_url, params: { post: { title: "", description: "本文" } }
    end
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)

    get edit_post_url(posts(:one))
    assert_response :success
  end

  test "should update post with valid params" do
    sign_in users(:one)

    patch post_url(posts(:one)), params: { post: { title: "更新後のタイトル" } }
    assert_redirected_to post_url(posts(:one))
    assert_equal "更新後のタイトル", posts(:one).reload.title
  end

  test "should not update post without a title" do
    sign_in users(:one)

    patch post_url(posts(:one)), params: { post: { title: "" } }
    assert_response :success
    assert_not_equal "", posts(:one).reload.title
  end

  test "should destroy post" do
    sign_in users(:one)

    assert_difference("Post.count", -1) do
      delete post_url(posts(:one))
    end
    assert_redirected_to posts_url
  end
end
