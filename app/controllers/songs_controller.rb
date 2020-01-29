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
    if @album.user_id == current_user.id
      @artist = Artist.find(@album.artist_id)
      @song = Song.new(song_params)
      @song.album_id = @album.id
      @song.artist_id = @artist.id
      @song.save
      binding.pry
      redirect_to album_path(@album)
    else
      puts "you are not allowed for this action"
    end
  end

    # if @album.user_id == current_user.id
    #   @artist = Artist.find(@album.artist_id)

    #   songs_array = [
    #                   song_params, song_params, song_params, song_params, song_params,
    #                   song_params, song_params, song_params, song_params, song_params
    #                 ]
    #   songs_array.each do |s|
    #     if s.empty?
    #       s.delete
    #     end
    #   end
    #   @songs = Song.create(songs_array)

    #   @songs.each do |s|
    #     s.album_id = @album.id
    #   end

    #   @songs.each do |s|
    #     s.artist_id = @artist.id
    #   end

    #   binding.pry
    #   @songs.save
    #   redirect_to album_path(@album)
    # else
    #   return "you are not allowed for this action"
    # end

  def show
  end

  def edit
  end

  def update
    @song.update(song_params)
  end

  def destroy
    if current_user.id == @album.user_id
      @song = Song.find(params[:id])
      @song.destroy
      redirect_to album_songs_path(@album)
    else
      puts 'you are not allowed'
    end
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def song_params
    params.require(:song).permit(:title)
  end
end
