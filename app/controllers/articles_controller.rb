class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
    if user_signed_in?
      @article.user_id = current_user.id
    else
    end
    if @article.save
      redirect_to articles_path, notice: '新しく記事を作成しました！'
    else
      render action: path[:action]
    end
  end

  def update
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:genre_id, :user_id, :title, :explain, :image, :ip)
  end
end
