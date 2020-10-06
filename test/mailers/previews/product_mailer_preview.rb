# Preview all emails at http://localhost:3000/rails/mailers/product_mailer
class ProductMailerPreview < ActionMailer::Preview
  def active_product
    user = User.last
    product = Product.last
    ProductMailer.active_product(user, product)
  end

end
