class GenreController < ApplicationController
  def index
    @genre = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Album.new(genre_params)
    @genre.save
    redirect_to genre_path(@genre)
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
