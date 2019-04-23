class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.article.subject
  #
  def article(user)
    @greeting = "Hi"

    mail(to: user.email, subject: "Rubriques")
  end
end
