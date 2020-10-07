class FavarticlesController < ApplicationController
	def create
		@favarticle = Favarticle.new(favarticle_params)
		@id = @favarticle.article_id
		@favarticle.save
		redirect_to article_path(@id)
	end

	def destroy
		favarticle = Favarticle.find(params[:id])
		@id = favarticle.article_id
		favarticle.destroy
		redirect_to article_path(@id)
	end

	private
	def favarticle_params
		params.require(:favarticle).permit(:article_id, :user_id)
	end
end
