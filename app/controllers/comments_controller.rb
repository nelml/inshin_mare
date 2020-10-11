class CommentsController < ApplicationController

	def create
		comment = Comment.new(comment_params)
		@article = comment.article
		if comment.save
			redirect_to article_path(@article) , notice: "コメントの投稿に成功しました。"
		else
			render "articles/show"
		end
	end

	def destroy
		comment = Comment.find(params[:id])
		@id = comment.article_id
		comment.destroy
		redirect_to article_path(@id)
	end

	private
	def comment_params
    	params.require(:comment).permit(:name, :image, :explain, :user_id, :article_id)
	end
end
