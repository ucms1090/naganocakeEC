class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to admin_genre_path(genre.id)
    else
      render new
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
