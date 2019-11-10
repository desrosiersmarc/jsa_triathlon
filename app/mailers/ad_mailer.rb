class AdMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ad_mailer.new_ad.subject
  #
  def new_ad(product, mailing_list)
    @product = product
    mail to: "mdesrosiers@orange.fr"
  end
end
