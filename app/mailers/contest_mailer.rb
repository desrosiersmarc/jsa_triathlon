class ContestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contest_mailer.result.subject
  #
  def result(users, article)
    @article = article
    @users = users

    mail(to: @article.authors.last.user.email, Bcc: @users, subject: "[JSA] Résultats de #{@article.name} #{l @article.date, format: '%B'}")
  end
end
