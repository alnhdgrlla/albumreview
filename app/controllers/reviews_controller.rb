class ReviewsController < ApplicationController
    before_action :set_album, only: [:new, :create, :show, :edit, :update]

  def index
    @album = Album.find(params[:album_id])
    @review = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.album = @album
    @review.user = current_user
    if @review.save
       redirect_to album_reviews_path(params[:album_id])
     else
      binding.pry
    end
  end

  def show
  end

  def edit
  end

  def update
    @review.update(song_params)
  end

  def destroy
    @review = Review.find(params[:id])
    if current_user.id == @review.user_id
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to album_reviews_path(params[:album_id])
    else
      return "you are not allowed for this action"
    end
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
