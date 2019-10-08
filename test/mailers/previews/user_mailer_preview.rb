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
    club_events = article_by_type(1)
    training_events = article_by_type(2)
    next_contests = article_by_type(3)
    last_results = article_by_type(6)
    tri_school = article_by_type(4)
    various_articles = article_by_type(9)
    # pictures
    # ads

    UserMailer.newsletter(club_events,
                          training_events,
                          next_contests,
                          last_results,
                          tri_school,
                          various_articles)

  end

  def article_by_type(type)
    Article.where(article_type: type)
           .where('updated_at >= ?', Time.now-30.day)
  end

end
