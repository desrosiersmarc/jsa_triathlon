class ClubsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :impots ]

  def new
  end

  def index
    @clubs = Article.where(article_type: 7) + Article.where(article_type: 8)

  end

  def finances
  end

  def impots
    @impots = Article.where(article_type: 8).first
  end

end
