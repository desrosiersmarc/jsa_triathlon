class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.article.subject
  #
  def article(user, article)
    @article = article
    mail(to: user.email, subject: "[JSA] Nouvel article dans la rubrique : #{@article.article_type.name.upcase}")
  end
end
