class AdminsController < ApplicationController
	before_action :authenticate_admin!
  def top
  	@contacts = Contact.all.includes(:user).order(created_at: :asc).take(5)
  	@genres = Genre.all.includes(:user).order(created_at: :desc).take(5)
  	@articles = Article.all.includes(:genre).order(created_at: :desc).take(10)
  end
end
