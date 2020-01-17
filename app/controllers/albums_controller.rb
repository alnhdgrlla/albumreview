class AlbumsController < ApplicationController
    before_action :set_album, only: [ :show, :edit, :update, :destroy]

  def index
    @genre = Genre.find(params[:genre_id])
    @albums = Album.all
  end

  def new
    @genre = Genre.find(params[:genre_id])
    @album = Album.new
  end

  def create
    @genre = Genre.find(params[:genre_id])
    @album = Album.new(album_params)
    @album.genre = @genre
    @album.save
    redirect_to genre_path(@genre)
  end

  def show
  end

  def edit
  end

  def update
    @album.update(album_params)
  end

  def destroy
    @album.destroy
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :genre_name)
  end
end
