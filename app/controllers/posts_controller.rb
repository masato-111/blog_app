class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save 
      redirect_to posts_path
    else
      render :new
    end
  end



  private
    def posts_params
      params.expect(post: [:title,:description,:image])
    end
end


