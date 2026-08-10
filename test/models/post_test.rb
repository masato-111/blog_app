require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "is valid with a title" do
    post = Post.new(title: "タイトル", description: "本文")
    assert post.valid?
  end

  test "is invalid without a title" do
    post = Post.new(title: "", description: "本文")
    assert_not post.valid?
    assert_includes post.errors[:title], "can't be blank"
  end

  test "#excerpt truncates a long description" do
    post = Post.new(description: "a" * 100)
    assert_equal 60, post.excerpt.length
    assert post.excerpt.end_with?("...")
  end

  test "#formatted_created_at formats the date in Japanese" do
    post = posts(:one)
    assert_equal post.created_at.strftime("%Y年%m月%d日 %H:%M"), post.formatted_created_at
  end
end
