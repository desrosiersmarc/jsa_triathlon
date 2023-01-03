class UpdateToProductType < ActiveRecord::Migration[5.1]
  def change
    ProductType.create! id:1, name: "Tenues"
    ProductType.create! id:2, name: "Bourse d'échange"
    ProductType.find(2).update(name: 'Petites annonces')
  end
end
