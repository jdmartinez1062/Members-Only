class PostsController < ApplicationController
  before_action :find_user, only: [:create, :edit, :update]
  def new
    @post = Post.new()
  end
  
  def index
  end

  def create
    @post = Post.new(post_params, @user.id)
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

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def find_user
    #@user = User.find(session[:id])
  end

end
