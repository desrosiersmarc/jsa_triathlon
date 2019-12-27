# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/article
  def article
    # UserMailer.article
    article = Article.last
    user = User.first
    UserMailer.article(user, article)
  end

  def newsletter
    club_events = article_by_type_next(1)
    training_events = article_by_type_next(2)
    next_contests = article_by_type_next(3)
    last_results = article_by_type_past(6)
    tri_school = article_by_type_past(4)
    various_articles = article_by_type_past(9)
    birthdays = birthday_list_method
    pictures = Picture.last
    ads_count = Product.where(product_type_id: 2).count

    UserMailer.newsletter(club_events,
                          training_events,
                          next_contests,
                          last_results,
                          tri_school,
                          various_articles,
                          birthdays,
                          pictures,
                          ads_count)

  end

  def article_by_type_past(type)
    articles = Article.where(article_type: type)
                      .where('updated_at >= ?', Time.now-30.day)
                      .sort_by {|article| article.date}
    if articles.count > 3
      return articles.take(3)
    else
      return articles
    end
  end

  def article_by_type_next(type)
    articles = Article.where(article_type: type)
                      .where('updated_at >= ?', Time.now)
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
