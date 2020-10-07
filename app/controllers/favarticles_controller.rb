class FavarticlesController < ApplicationController
	def create
		favarticle = Favarticle.new(favarticle_params)
		favarticle.save
		redirect_to article_path(favarticle.article_id)
	end

	def destroy
	end

	private
	def favarticle_params
		params.require(:favarticle).permit(:article_id, :user_id)
	end
end
