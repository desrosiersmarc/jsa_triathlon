class DashboardsController < ApplicationController
  def index
    # stat_articles = []
    # User.all.each do |user|
    #   if user.articles.count > 0
    #     stat_articles << {user: user, nb_articles: user.articles.count}
    #   end
    # end
    # @stat_articles = stat_articles.sort_by{|statistic| statistic[:nb_articles]}
    #                               .reverse
    #                               .take(5)
    @stat_articles = statistics("articles")
    @stat_reviews = statistics("reviews")
    @stat_likes = statistics("likes")
  end

private
  def statistics(model_to_analyse)
    stats = []
    User.all.each do |user|
      if user.send(model_to_analyse).count > 0
        stats << {user: user, nb_items: user.send(model_to_analyse).count}
      end
    end
    @stats = stats.sort_by{|statistic| statistic[:nb_items]}
                                  .reverse
                                  .take(5)
  end
end
