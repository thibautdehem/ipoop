class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @toilet = Toilet.find(params[:toilet_id])
    @review.user = current_user
    authorize @review
    @review.toilet_id = @toilet
    if @review.save!
      redirect_to toilet_path(@toilet)
    else
      render 'toilets/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
