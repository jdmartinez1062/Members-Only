class PostsController < ApplicationController
  def new
    @post = Post.new()
  end
  
  def index
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post Created"  
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

end
