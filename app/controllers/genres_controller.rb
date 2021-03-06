class GenresController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit]
  def search
    if params[:genre_search].present?
      @genres = Genre.where('name_kana LIKE ?', "%#{params[:genre_search]}%").order(:name_kana)
    elsif params[:genre_50search].present?
      @genres = Genre.where('name_kana LIKE ?', "#{params[:genre_50search]}%").order(:name_kana)
    else
      @genres = Genre.where('name_kana LIKE ?', "あ%").order(:name_kana)
    end
  end

  def new
    @genre = Genre.new
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to genre_path(@genre.id)
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to genres_path, notice: 'ジャンルの新規登録に成功しました！'
    else
      render action: :new
    end
  end

  def show
    @genre = Genre.find(params[:id])
    @articles = @genre.articles.order(created_at: :desc).page(params[:page]).per(10)
    if user_signed_in?
      if @favgenre = Favgenre.exists?(user_id: current_user.id, genre_id: @genre.id)
        @favgenre = Favgenre.find_by(user_id: current_user.id, genre_id: @genre.id)
      else
        @favgenre = Favgenre.new
      end
    end

  end

  def index
    search
  end

  def edit
    @genre = Genre.find(params[:id])
    if @genre.user_id != current_user.id
      redirect_to root_path
    end
  end

  def destroy
    genre = genre.find(params[:id])
    genre.destroy
    redirect_to admins_top_path
  end

  private
  def genre_params
    params.require(:genre).permit(:user_id, :name, :name_kana, :introduction)
  end

end
