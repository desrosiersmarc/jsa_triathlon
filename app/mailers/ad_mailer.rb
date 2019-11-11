class AdMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ad_mailer.new_ad.subject
  #
  def new_ad(product, mailing_list)
    @product = product
    @mailing_list = "mdesrosiers@orange.fr"
    mail(Bcc: @mailing_list , subject: "[JSA] A vendre #{@product.name}")
  end
end
