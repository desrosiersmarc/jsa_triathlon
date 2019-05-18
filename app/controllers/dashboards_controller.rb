class DashboardsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :influencers, only: [:index]

  def index
    @nb_articles = Article.where('updated_at > ?', Time.now-7.day)
                          .where(active: true)
                          .count
    @nb_reviews = Review.where('updated_at > ?', Time.now-7.day)
                          .count
    @nb_likes = Like.where('updated_at > ?', Time.now-7.day)
                          .count
  end

  def influencers
    influencers = []
    User.all.each do |user|
      contributions = 0
      contributions = user.articles.where(article_type_id: 3)
                                   .where('updated_at > ?', Time.now-30.day)
                                   .count*5
                    + user.reviews.where('updated_at > ?', Time.now-30.day)
                                  .count*2
                    + user.likes.where('updated_at > ?', Time.now-30.day)
                                .count
      if contributions != 0
        influencers << {user: user, score: contributions}
      end
    end
    @influencers = influencers.sort_by{|influencer| influencer[:score]}
                              .reverse
                              .take(5)
  end
end
