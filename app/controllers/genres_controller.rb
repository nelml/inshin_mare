class GenresController < ApplicationController
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
  end

  def index
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def destroy
    genre = genre.find(params[:id])
    book.destroy
    redirect_to genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:user_id, :name, :name_kana, :introduction)
  end

end
