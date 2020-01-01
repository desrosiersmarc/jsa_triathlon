class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.article.subject
  #
  def article(users, article)
    @article = article
    @users = users
    mail(Bcc: @users, subject: "[JSA] #{@article.article_type.name.upcase}
      -#{@article.name} #{l @article.date, format: '%A %d %B'}")
  end

  def newsletter(users,
                alert,
                club_events,
                training_events,
                next_contests,
                last_results,
                tri_school,
                various_articles,
                birthdays,
                pictures,
                ads_count,
                products)
    @users = users
    @alert = alert
    @club_events = club_events
    @training_events = training_events
    @next_contests = next_contests
    @last_results = last_results
    @tri_school = tri_school
    @various_articles = various_articles
    @birthdays = birthday_list_method
    @pictures = Picture.last
    @ads_count = Product.where(product_type_id: 2).count
    @newsletter_chapters = Newsletter.all
    @products = products

    mail(Bcc: @users, subject: "JSA-Newsletter #{l Time.now, format: '%B %Y'}")
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
