class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:sportswears, :show, :petites_annonces]
  before_action :load_collections, only: [:new, :create, :edit, :update]
  before_action :find_product, only: [:show, :edit, :update]
  before_action :mailing_list_1, only: [:create, :update]
  before_action :mailing_list_2, only: [:create, :update]

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

  def petites_annonces
    @triathlon_products = select_product(1)
    @swim_products = select_product(2)
    @bike_products = select_product(3)
    @run_products = select_product(4)
    @electro_products = select_product(5)
    @rent_products = select_product(6)

    @sold_products = Product.where(product_type_id: 2)
                              .where(active: true)
                              .where(sold: true)
                              .where("updated_at > ?", Time.now-30.day)

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      if @product.product_type_id == 2
        AdMailer.new_ad(@product, @list_members_1).deliver_later
        AdMailer.new_ad(@product, @list_members_2).deliver_later
      end
      create_notifications(@product.id, 'product')
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
      if @product.notification?
        update_notifications(@product.id, 'product')
      else
        create_notifications(@product.id, 'product')
      end
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
      :sold,
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

  def select_product(sport_type_id)
    Product.where(product_type_id: 2)
           .where(sport_type_id: sport_type_id)
           .where(active: true)
           .where(sold: false)
           .sort_by {|product| product.sport_type}
  end

  def mailing_list_1
    @list_members_1 = User.where(notification: true)
                        .where(mailing_group: 1)
                        .map{|user| user.email}.join(';')
  end
  def mailing_list_2
    @list_members_2 = User.where(notification: true)
                        .where(mailing_group: 2)
                        .map{|user| user.email}.join(';')
  end

end
