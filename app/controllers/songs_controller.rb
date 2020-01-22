class SongsController < ApplicationController
  before_action :set_album, only: [ :show, :edit, :update, :destroy]

  def new
    # binding.pry
    @album = Album.find(session[:album_id])
    @song = Song.new
  end

  def create
    @album = Album.find(session[:album_id])
    @artist = Artist.find(@album.artist_id)
    @song = Song.new(song_params)
    @song.album_id = @album.id
    @song.artist_id = @artist.id
    @song.save
    redirect_to album_path(@album)
  end

  def show
  end

  def edit
  end

  def update
    @song.update(song_params)
  end

  def destroy
    @song.destroy
  end

  private

  def set_album
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title)
  end
end
