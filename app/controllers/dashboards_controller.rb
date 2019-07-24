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

    calculation_period = Time.now-31.day

    User.all.each do |user|
      contributions = 0

      articles_pts = user.nb_contests(calculation_period)*5


      reviews_pts = user.reviews
                        .where('updated_at > ?', calculation_period).count*2

      likes_pts = user.likes
                      .where('updated_at > ?', calculation_period).count


      contributions = articles_pts + reviews_pts + likes_pts

      if contributions != 0
        influencers << {user: user, score: contributions,
                        nb_articles: articles_pts/5,
                        nb_reviews: reviews_pts/2,
                        nb_likes: likes_pts}
      end
    end
    @influencers = influencers.sort_by{|influencer| influencer[:score]}
                              .reverse
                              .take(10)
  end
end
