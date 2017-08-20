class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    @user.save
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
