class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.order(created_at: :desc)
  end
  def show
    
  end

  def edit
    
  end

  def update
    @post= Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    
    @post.destroy!
      redirect_to posts_path
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

    def set_post
    @post = Post.find(params[:id])
    end
end


