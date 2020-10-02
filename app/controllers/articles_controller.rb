class ArticlesController < ApplicationController
  def search
    if params[:genre_search].present?
      @genres = Genre.where('name_kana LIKE ?', "%#{params[:genre_search]}%")
    else
      @genres = Genre.all.order(created_at: :desc).take(4)
    end
  end

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
      render action: :new
    end
  end

  def update
    @article = Article.find(params[:id])
  end

  def index
    search
    if params[:gen].present?
      @articles = Article.where(genre_id: params[:gen])
    else
      @articles = Article.all.order(created_at: :desc)
    end
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
