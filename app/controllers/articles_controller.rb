class ArticlesController < ApplicationController
  before_action :authenticate_admin!, only:[:destroy]

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
      @articles = Article.where(genre_id: params[:gen]).includes(:genre).page(params[:page]).per(10)
    else
      @articles = Article.all.order(created_at: :desc).includes(:genre).page(params[:page]).per(10)
    end
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.order(created_at: :asc)
    if @article.user.present?
      @user = @article.user
    else
    end
    @genre = @article.genre
    @comment = Comment.new
    if user_signed_in?
      if @favarticle = Favarticle.exists?(user_id: current_user.id, article_id: @article.id)
        @favarticle = Favarticle.find_by(user_id: current_user.id, article_id: @article.id)
      else
        @favarticle = Favarticle.new
      end
    end
  end

  def edit
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to admins_top_path
  end

  private
  def article_params
    params.require(:article).permit(:genre_id, :user_id, :title, :explain, :image, :ip)
  end
end
