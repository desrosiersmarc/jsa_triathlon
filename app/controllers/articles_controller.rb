class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update]
  before_action :charge_article_types, only: [:index, :new, :edit]


  def index
    # @articles = Article.where(active: true)
                        # .sort_by { |article| article.date}
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
    @reviews = @article.reviews.where('content != ?', '')
                                .sort_by {|review| review.created_at}
                                .reverse

    if @article.reviews.map{|r| r.user_id}.include?(current_user.id)
      reviews = @article.reviews.where(user_id: current_user.id)
      @review = reviews.first
      likes = reviews.map{|r| r.like}.reduce(:+)
      case likes
      when 1
        @method = "patch"
        @label = "Dislike"
        @add_like = 0
      when 2..1000
        @method = "patch"
        @label = "Dislike"
        @add_like = -1
      else
        @method = "patch"
        @label = "Like"
        @add_like = 1
      end
    else
      @review = Review.new
      @method = "post"
      @label = "Like"
      @add_like = 1
    end
  end

  def edit
  end

  def update
    @article.update(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

private
  def article_params
    params.require(:article).permit(
      :name,
      :date,
      :start_time,
      :end_time,
      :location,
      :link,
      :content,
      :user_id,
      :article_type_id,
      :active,
      :photo)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def charge_article_types
    @article_types = ArticleType.all
  end
end
