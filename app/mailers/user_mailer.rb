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
end
