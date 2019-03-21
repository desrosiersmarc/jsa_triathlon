class PagesController < ApplicationController
  skip_before_action :authenticate_user!,
                      only: [:home, :calendar, :club_events, :results]
  before_action :select_contests, only: [:home, :contests]
  before_action :select_club_events, only: [:home, :club_events]
  before_action :select_school, only: [:home, :school]
  before_action :select_results, only: [:home, :results]
  before_action :select_clubs, only: [:home]
  before_action :select_trainings, only: [:home]

  def home
    @pictures = Picture.all
                      .sort_by { |article| article.updated_at}
                      .reverse
                      .take(3)
    # 5 Partner
    @club = Club.all.first
    @clubs = @clubs.take(3)
    @club_events_top3 = @club_events.take(3)
    @contests_top3 = @contests.take(3)
    @schools_top3 = @schools.take(3)
    @results_top3 = @results.take(3)
    @trainings_top3 = @trainings.take(3)

    @product_echange_count = Product.where(product_type_id: 2, active: true).count


  end

  def my_articles
    @my_articles = Article.where(user: current_user)
                          .sort_by {|article| article.updated_at}
                          .reverse
  end


private
  def select_articles(article_type)
    articles = Article.where(article_type: article_type, active: true)
            .where('date > ?', Time.now - 7.day)
            .sort_by { |article| article.date}
    if articles == []
      return Article.where(article_type: article_type, active: true)
    else
      return articles
    end
  end

  def select_contests
    @contests = select_articles(3)
  end

  def select_all_articles(article_type)
    articles = Article.where(article_type: article_type, active: true)
                .sort_by {|article| article.date}
                .reverse
  end

  def select_club_events
    @club_events = select_articles(1)
  end

  def select_school
    @schools = select_articles(4)
  end

  def select_results
    @results = select_all_articles(6)
  end

  def select_clubs
    @clubs = select_articles(7)
  end

  def select_trainings
    @trainings = select_articles(2)
  end

end
