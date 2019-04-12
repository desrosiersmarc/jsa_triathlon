class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: []
  before_action :find_article, only: [:new, :create, :update]
  before_action :find_review, only: [:update]

  def new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.article_id = @article.id
    if @review.save
      redirect_to article_path(@article)
    end
  end

  def update
    @review.update(review_params)
    if @review.save
      redirect_to article_path(@article)
    end
  end

private
  def review_params
    params.require(:review).permit(:content, :like, :user_id, :article_id)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
