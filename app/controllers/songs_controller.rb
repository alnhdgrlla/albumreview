class SongsController < ApplicationController
  before_action :set_album, only: [:index,:new, :create, :show, :edit, :update, :destroy]

  def index
    @songs = Song.all.where(album_id: @album_id)
  end

  def new
    # binding.pry
    @song = Song.new
  end

  def create
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
    @album = Album.find(params[:album_id])
  end

  def song_params
    params.require(:song).permit(:title)
  end
end
