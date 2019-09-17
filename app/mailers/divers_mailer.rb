class DiversMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.divers_mailer.divers_article.subject
  #
  def divers_article(users, article)
    @article = article
    @users = users
    mail(to: @article.authors.last.user.email, Bcc: @users, subject: "[JSA] #{@article.name} ")
  end
end
