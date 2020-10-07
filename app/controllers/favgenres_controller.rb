class FavgenresController < ApplicationController
	def create
		@favgenre = Favgenre.new(favgenre_params)
		@id = @favgenre.genre_id
		@favgenre.save
		redirect_to genre_path(@id)
	end

	def destroy
		favgenre = Favgenre.find(params[:id])
		@id = favgenre.genre_id
		favgenre.destroy
		redirect_to genre_path(@id)
	end

	private
	def favgenre_params
		params.require(:favgenre).permit(:genre_id, :user_id)
	end
end
