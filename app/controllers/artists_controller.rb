class ArtistsController < ApplicationController
    before_action :set_genre, only: [:index, :new, :edit, :update, :destroy]

  def index
    @artists = Artist.all.where(genre_id: params[:genre_id] )
  end

  def show
    # binding.pry
    @album_id = params[:album_id]
    @artist = Artist.find(params[:id])
    @genre_id = @artist.genre_id
    @genre = @artist.genre
  end

  def new
    @genre = Genre.find(params[:genre_id])
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user
    @artist.genre_id = params[:genre_id]
    @id = params[:genre_id]
    if @artist.save
        redirect_to genre_path(@id)
    else
      binding.pry
    end
  end

  def edit
  end

  def update
    @artist.update(artist_params)
  end

  def destroy
    @artist.destroy
  end

  private

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end

  def artist_params
    params.require(:artist).permit(:name, :genre_id)
  end
end
