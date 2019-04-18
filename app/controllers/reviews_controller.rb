class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: []
  before_action :find_article, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @reviews =@article.reviews

    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.article_id = @article.id
    if @review.save
      respond_to do |format|
        format.html {redirect_to article_path(@article)}
        format.js
      end
    end
    @notice = current_user.firstname + ", ton commentaire a bien été posté... 👍"
  end

private
  def review_params
    params.require(:review).permit(:content, :like, :user_id, :article_id)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

end
