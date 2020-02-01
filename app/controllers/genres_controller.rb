class GenresController < ApplicationController
  def index
    @genres = Genre.paginate(page: params[:page], per_page: 5)
  end

  def show
    @genre = Genre.find(params[:id])
    @genre_id = @genre.id
    @artists = Artist.where(genre_id: @genre_id).paginate(page: params[:page], per_page: 5)
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
