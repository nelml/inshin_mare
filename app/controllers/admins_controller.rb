class AdminsController < ApplicationController
	before_action :authenticate_admin!
  def top
  	@contacts = Contact.all.includes(:user).order(created_at: :asc).page(params[:contact_page]).per(10)
  	@genres = Genre.all.includes(:user).order(created_at: :desc).page(params[:genre_page]).per(10)
  	@articles = Article.all.includes(:genre).order(created_at: :desc).page(params[:article_page]).per(10)
  	@users = User.all.order(created_at: :desc).page(params[:user_page]).per(10)
  end
end
