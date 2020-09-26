class UsersController < ApplicationController
  def top
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
  end



  private
  def user_params
    params.require(:user).permit(:email, :name, :introduction, :image)
  end
end
