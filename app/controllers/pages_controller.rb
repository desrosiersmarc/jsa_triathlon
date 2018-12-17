class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :calendar]

  def home
    @pictures = Picture.all
                      .sort_by { |article| article.updated_at}
                      .reverse
                      .take(3)
    @club_events = select_articles(1)
    @training = Article.where(article_type: 2).last
    @contests = select_articles(2)
    @schools = select_articles(3)
    @results = select_articles(6)
    #TODO @picture for mobile and @pictures > mobile

  end

private
  def select_articles(article_type)
    Article.where(article_type: article_type)
            .sort_by { |article| article.updated_at}
            .reverse
            .take(3)
  end
end
