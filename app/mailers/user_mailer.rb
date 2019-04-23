class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.article.subject
  #
  def article(user, article_type)
    mail(to: user.email, subject: "[JSA] Nouvel article #{article_type.upcase}")
  end
end
