class AdminsController < ApplicationController
  def top
  	@genres = Genre.all
  	@users = @genres.user
  end
end
