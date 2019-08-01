class DashboardsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :influencers, only: [:index]

  def index
    @nb_articles = Article.where('created_at > ?', Time.now-7.day)
                          .where(active: true)
                          .count
    @nb_reviews = Review.where('created_at > ?', Time.now-7.day)
                          .count
    @nb_likes = Like.where('created_at > ?', Time.now-7.day)
                          .count
  end

  def influencers
    influencers = []

    calculation_period = Time.now-31.day

    User.all.each do |user|
      contributions = 0

      articles_nb = user.nb_articles(calculation_period)


      reviews_nb = user.reviews
                        .where('created_at > ?', calculation_period).count

      likes_nb = user.likes
                      .where('created_at > ?', calculation_period).count

      pictures_nb = Picture.where(user_id: user.id)
                            .where('created_at > ?', calculation_period)
                            .count

      products_nb = Product.where(user_id: user.id)
                            .where('created_at > ?', calculation_period)
                            .count


      contributions = articles_nb*5 + reviews_nb*2 + likes_nb + pictures_nb*5 + products_nb*3


      if contributions != 0
        influencers << {user: user, score: contributions,
                        nb_articles: articles_nb,
                        nb_reviews: reviews_nb,
                        nb_likes: likes_nb,
                        nb_pictures: pictures_nb,
                        nb_products: products_nb
                        }
      end
    end
    @influencers = influencers.sort_by{|influencer| influencer[:score]}
                              .reverse
                              .take(10)
  end
end
