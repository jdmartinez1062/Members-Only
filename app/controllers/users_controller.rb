class UsersController < ApplicationController
  include SessionsHelper
  before_action :remember_create, only: [:create]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Sign up successfull'
      log_in(@user)
      redirect_to @user
    else
      flash.now[:warnign] = 'Sign up unsuccessfull'
      render 'new'
    end
  end

  def edit; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def remember_create
    @user = User.new
    @user.remember
  end
end
