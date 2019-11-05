# Preview all emails at http://localhost:3000/rails/mailers/ad_mailer
class AdMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ad_mailer/new_ad
  def new_ad
    AdMailer.new_ad
  end

end
