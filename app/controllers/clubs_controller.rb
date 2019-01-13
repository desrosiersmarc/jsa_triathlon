class ClubsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index ]

  def index
    @clubs = Article.where(article_type: 7)
  end

  def finances
  end

  def impots
  end

end
