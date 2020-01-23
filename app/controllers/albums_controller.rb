class AlbumsController < ApplicationController
    before_action :set_artist, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @albums = Album.where(artist_id: params[:artist_id] )
    # binding.pry
  end

  def new
    # binding.pry
    @album = Album.new
  end

  def create
    # binding.pry
    @genre_id = @artist.genre_id
    @album = Album.new(album_params)
    @album.user = current_user
    @album.artist_id = @artist.id
    @album.genre_id = @artist.genre_id
    # @artist_id = session[:artist_id]
    # @genre_id = session[:genre_id]
    # @id = @album.artist_id
    if @album.save
        redirect_to artist_albums_path(@artist)
    else
      binding.pry
    end
  end

  def show
    @album_id = @album.id
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

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def album_params
    params.require(:album).permit(:title, :genre_id)
  end
end
