class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.article.subject
  #
  def article(user, article)
    @article = article
    @user = user
    mail(to: @user.email, subject: "[JSA] #{@article.name} #{l @article.date, format: '%A %d %B'}")
  end
end
