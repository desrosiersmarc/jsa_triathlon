class PagesController < ApplicationController
  skip_before_action :authenticate_user!,
                      only: [:home, :calendar, :club_events, :results,
                        :contests, :tricross, :subscription]
  before_action :select_contests, only: [:home, :contests, :list_dates]
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
    # @clubs = @clubs.take(3)
    # @clubs = @clubs
    @club_events_top3 = select_articles_homepage(1)
    @contests_top3 = select_articles_homepage(3)
    @schools_top3 = select_articles_homepage(4)
    @results_top3 = @results.take(3)
    @trainings_top3 = select_articles_homepage(2)
    @partners = Partner.where(active: true)




    @product_echange_count = Product.where(product_type_id: 2, active: true).count


  end

  def my_articles
    @my_articles = current_user.articles.uniq
                               .sort_by {|article| article.updated_at}
                               .reverse
  end

  def my_ads
    @my_ads = Product.where(user: current_user, product_type_id: 2)
  end

  def trainings
    # @trainings = select_articles(2,365).reverse
    @week_articles = select_week_articles(2)
  end

  def contests
    @list_dates = @contests.map {|article| article.date.strftime('%Y-%-m-%d')}
                           .uniq
  end

  def divers
    @divers = select_articles(9,365).reverse
  end

  def subscription
    @contactables = User.where(contactable: true)
  end


private
  def select_articles(article_type, nb_days)
    articles = Article.where(article_type: article_type, active: true)
            .where('date > ?', Time.now - nb_days.day)
            .sort_by { |article| article.date}
    if articles == []
      return Article.where(article_type: article_type, active: true).last
    else
      return articles
    end
  end

  def select_week_articles(article_type)
    # Collect today date and day of the week
    week_day = Time.now.wday
    # Calculate the difference between today and the monday of the week and the sunday
    week_monday = Time.now-week_day.day
    week_sunday = Time.now+(7-week_day).day
    # Select articles between the monday and the sunday
    week_articles = Article.where(article_type: article_type, active: true)
                           .where('date > ?', week_monday)
                           .where('date <= ?', week_sunday)
                           .sort_by {|article| article.date}
  end

  def select_articles_homepage(article_type)
    articles = Article.where(article_type: article_type, active: true)
                      .where('date > ?', Time.now-1.day)
                      .sort_by {|article| article.date}
    if articles.count > 3
      return articles.take(3)
    elsif articles.count == 0
      articles = []
      articles << Article.where(article_type: article_type, active: true).last
      return articles
    else
      return articles
    end

  end

  def select_contests
    @contests = select_articles(3, 365)
  end

  def select_all_articles(article_type)
    articles = Article.where(article_type: article_type, active: true)
                .sort_by {|article| article.date}
                .reverse
  end

  def select_club_events
    @club_events = select_articles(1, 365).reverse
  end

  def select_school
    @schools = select_articles(4, 365)
  end

  def select_results
    @results = select_all_articles(6)
  end

  def select_clubs
    @clubs = select_articles(7, 365)
  end

  def select_trainings
    @trainings = select_articles(2, 365)
  end

end
