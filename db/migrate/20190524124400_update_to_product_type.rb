class UpdateToProductType < ActiveRecord::Migration[5.1]
  def change
    ProductType.find(2).update(name: 'Petites annonces')
  end
end
