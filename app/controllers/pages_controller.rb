class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :calendar]

  def home
    @pictures = Picture.all
                      .sort_by { |article| article.updated_at}
                      .reverse
                      .take(3)
    @club_events = select_articles(1)
    @contests = select_articles(3)
    @schools = select_articles(4)
    @results = select_articles(6)
    # 2 Training
    # 5 Partner


  end

private
  def select_articles(article_type)
    Article.where(article_type: article_type)
            .sort_by { |article| article.updated_at}
            .reverse
            .take(3)
  end
end
