class ArtistsController < ApplicationController
    before_action :set_artist, only: [ :show, :edit, :update, :destroy]

  def index
    @genre = Genre.find(params[:id])
    @artists = Artist.all.where(genre_id: @genre.id)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
  end

  def show
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

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :genre_name)
  end
end
