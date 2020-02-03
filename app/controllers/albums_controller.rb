class AlbumsController < ApplicationController
    before_action :set_artist, only: [:index, :new, :edit, :create, :update, :destroy]

  def index
    @albums = Album.where(artist_id: params[:artist_id])
    @album = Album.new
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
    @album_id = params[:id]
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
    # binding.pry
  end

  def update
    if current_user.id != Album.find(params[:id]).user_id
      puts "You are not allowed for this action"
    else
      @album = Album.find(params[:id])
      if @album.update(album_params)
        redirect_to artist_albums_path(@artist)
      else
        puts "Update didnt finish succesflly"
      end
    end
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
