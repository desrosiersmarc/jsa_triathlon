class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:sportswears]

  def sportswears
    @sportswears = Product.where(product_type_id: 1)
  end
end
