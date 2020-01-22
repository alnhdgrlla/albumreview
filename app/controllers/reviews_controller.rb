class ReviewsController < ApplicationController
    before_action :set_review, only: [ :show, :edit, :update, :destroy]

  def index
    @album = Album.find(params[:album_id])
    @review = Review.all
  end

  def new
    @album = Album.find(params[:album_id])
    @review = Review.new
  end

  def create
    @album = Album.find(params[:album_id])
    @review = Review.new(album_params)
    @review.album = @album
    @review.user = current_user
    @review.save
    redirect_to album_reviews_path(@album.id)
  end

  def show
  end

  def edit
  end

  def update
    @review.update(song_params)
  end

  def destroy
    @review.destroy
  end

  private

  def set_album
    @review = Review.find(params[:id])
  end

  def album_params
    params.require(:review).permit(:content)
  end
end
