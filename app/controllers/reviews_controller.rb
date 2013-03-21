class ReviewsController < ApplicationController
  before_action :authorize
  before_action :find_post

  def index
    @reviews = @post.reviews
    respond_with @post, @reviews
  end

  def create
    @review = @post.reviews.new(review_params)
    @review.user = current_user
    @review.save!
    respond_with @post, @review, location: post_review_anchor(@post, @review)
  end

  def update
    @review = @post.reviews.find(params[:id])
    @review.update!(review_params)
    respond_with @post, @review, location: post_review_anchor(@post, @review)
  end

  private

  def find_post
    @post = current_user.visible_posts.find(params[:post_id])
  end

  def review_params
    params.require(:review).permit(:content, :form)
  end
end
