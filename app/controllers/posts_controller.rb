class PostsController < ApplicationController
  include SessionsHelper
  include PostsHelper

  before_action :post_logged_in?, only: %i[new create edit update]
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post Created'
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit; end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def post_logged_in?
    unless logged_in?
      flash[:danger] = 'Log in first'
      redirect_to login_path
    end
  end
end
