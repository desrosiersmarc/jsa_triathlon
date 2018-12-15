class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update]
  before_action :charge_article_types, only: [:index, :new, :edit]


  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @article.update(article_params)
    if @article.save
      redirect_to articles_path
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
      :photo)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def charge_article_types
    @article_types = ArticleType.all
  end
end
