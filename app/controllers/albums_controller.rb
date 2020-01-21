class AlbumsController < ApplicationController
    before_action :set_album, only: [ :show, :edit, :update, :destroy]

  def index
    @genre = Genre.find(params[:genre_id])
    @albums = Album.all
  end

  def new
    # binding.pry
    @artist = Artist.find(session[:artist_id])
    @genre_id = @artist.genre_id
    @genre = Genre.find(@genre_id)
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    @artist = Artist.find(session[:artist_id])
    @album.artist_id = @artist.id
    @album.genre_id = @artist.genre_id
    id = @artist.id
    # @artist_id = session[:artist_id]
    # @genre_id = session[:genre_id]
    # @id = @album.artist_id
    if @album.save
        redirect_to artist_path(id)
    else
      binding.pry
    end
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
    params.require(:album).permit(:title, :genre_id)
  end
end
