class LikesController < ApplicationController
  skip_before_action :authenticate_user!, only: []
  before_action :find_like, only: [:update]
  before_action :find_article, only: [:new, :create, :update]

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    @like.article_id = @article.id
    if @like.save
      respond_to do |format|
        format.html {redirect_to article_path(@article)}
        format.js
      end
    end
  end

  def update
    @like.update(like_params)
    if @like.save
      respond_to do |format|
        format.html {redirect_to article_path(@article)}
        format.js
      end
    end
  end

private
  def like_params
    params.require(:like).permit(:like, :user_id, :article_id)
  end

  def find_like
    @like = Like.find(params[:id])
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

end
