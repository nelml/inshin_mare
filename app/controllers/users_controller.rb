class UsersController < ApplicationController
  def top
    @genres_random = Genre.all.shuffle.take(5)
    @genres_rank = Genre.all.sort{|a, b| b.favgenres.count <=> a.favgenres.count }.take(5)
    @articles = Article.all.order(created_at: :desc).take(4)
    @notices = Notice.all
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      @articles = @user.articles.order(created_at: :desc).includes(:genre).page(params[:page]).per(5)
      @favgenres = @user.favgenres
      @favarticles = @user.favarticles
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    bypass_sign_in(@user)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :introduction, :image, :password)
  end
end
