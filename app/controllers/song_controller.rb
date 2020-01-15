class SongController < ApplicationController
  before_action :set_album, only: [ :show, :edit, :update, :destroy]

  def index
    @album = Album.find(params[:album_id])
    @song = Song.all
  end

  def new
    @album = Album.find(params[:album_id])
    @song = Song.new
  end

  def create
    @album = Album.find(params[:album_id])
    @song = Song.new(album_params)
    @song.album = @album
    @song.save
    redirect_to genre_path(@album)
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
