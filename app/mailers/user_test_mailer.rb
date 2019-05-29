class UserTestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_test_mailer.email_test.subject
  #
  def email_test(email_list)
    mail(to: email_list, subject: 'Test de liste de diffusion')
  end
end
