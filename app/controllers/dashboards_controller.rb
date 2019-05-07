class DashboardsController < ApplicationController
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
      contributions = user.articles.count + user.reviews.count + user.likes.count
      if contributions != 0
        influencers << {user: user, score: contributions}
      end
    end
    @influencers = influencers.sort_by{|influencer| influencer[:score]}
                              .reverse
                              .take(5)
  end
end
