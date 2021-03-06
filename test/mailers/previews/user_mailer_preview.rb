# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/article
  def article
    # UserMailer.article
    article = Article.last
    user = User.first
    sender = 'mdesrosiers.test@gmail.com'
    UserMailer.article(user, article, sender)
  end

  def newsletter
    users = 'mdesrosiers@orange.fr'
    alert = nil
    club_events = article_by_type_next(1)
    training_events = article_by_type_next(2)
    next_contests = article_by_type_next(3)
    last_results = article_by_type_past(6)
    tri_school = article_by_type_past(4)
    various_articles = article_by_type_past(9)
    birthdays = birthday_list_method
    pictures = Picture.last
    products = Product.where('sport_type_id <> ?', 6)
                      .where(product_type_id: 2)
                      .where(active: true)
                      .where(sold: false)
                      .sort_by{|product| product.created_at}
    ads_count = products.count

    UserMailer.newsletter(users, alert, club_events,
                          training_events,
                          next_contests,
                          last_results,
                          tri_school,
                          various_articles,
                          birthdays,
                          pictures,
                          ads_count,
                          products)

  end

  def article_by_type_past(type)
    articles = Article.where(article_type: type)
                      .where(active: true)
                      .where('date >= ?', Time.now-30.day)
                      .sort_by {|article| article.date}
    if articles.count > 3
      return articles.take(3)
    else
      return articles
    end
  end

  def article_by_type_next(type)
    articles = Article.where(article_type: type)
                      .where(active: true)
                      .where('date >= ?', Time.now)
                      .sort_by {|article| article.date}
    if articles.count > 3
      return articles.take(3)
    else
      return articles
    end
  end

  def birthday_list_method
    birthday_list = []
    User.all.each do |user|
      if user.birthday?
        if user.birthday.month == Time.now.month
          birthday_list << user
        end
      end
    end
    return birthday_list
  end

end
