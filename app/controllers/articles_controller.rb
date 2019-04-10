class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update]
  before_action :charge_article_types, only: [:index, :new, :edit]


  def index
    @articles = Article.where(active: true)
                        .sort_by { |article| article.date}
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
    @review = Review.new
    @reviews = @article.reviews.where('content != ?', '')
                                .sort_by {|review| review.created_at}
                                .reverse
    @add_like = 1
    if current_user.reviews != []
      (current_user.reviews.map {|r| r.like}.reduce(:+) > 0) ? (@add_like = -1) : (@add_like = 1)
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
