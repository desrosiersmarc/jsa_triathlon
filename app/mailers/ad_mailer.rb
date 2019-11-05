class AdMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ad_mailer.new_ad.subject
  #
  def new_ad
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
