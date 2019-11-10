# Preview all emails at http://localhost:3000/rails/mailers/ad_mailer
class AdMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ad_mailer/new_ad
  def new_ad
    product = Product.last
    mailing_list = 'mdesrosiers@orange.fr'
    AdMailer.new_ad(product, mailing_list)
  end

end
