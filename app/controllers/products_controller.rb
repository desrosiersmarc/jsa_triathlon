class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:sportswears, :show, :bourse_echange]
  before_action :load_collections, only: [:new, :create, :edit, :update]
  before_action :find_product, only: [:show, :edit, :update]

  def sportswears
    @sportswears = if user_signed_in? && current_user.role == 'admin'
                    Product.where(product_type_id: 1)
                          .sort_by {|product| product.sport_type}
                  else
                    Product.where(product_type_id: 1)
                          .where(active: true)
                          .sort_by {|product| product.sport_type}
                  end
  end

  def bourse_echange
    @products = Product.where(product_type_id: 2)
                        .where(active: true)
                        .sort_by {|product| product.sport_type}
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end

  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def show
  end

private
  def product_params
    params.require(:product).permit(
      :user_id,
      :name,
      :description,
      :price,
      :stock,
      :size_id,
      :sex,
      :sport_type_id,
      :product_type_id,
      :active,
      :photo)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def load_collections
    @sizes = Size.all
    @product_types = ProductType.all
    @sex = ['Homme', 'Femme', 'Unisex']
    @sport_types = SportType.all
  end

end
