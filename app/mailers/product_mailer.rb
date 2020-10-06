class ProductMailer < ApplicationMailer

  def active_product(user, product)
    @user = user
    @product = product
    mail(to: @user.email, subject: 'Suspension de ton annonce')
  end
end
