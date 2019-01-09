class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.references :size, foreign_key: true
      t.string :description
      t.integer :price
      t.integer :stock
      t.string :sex
      t.references :sport_type, foreign_key: true
      t.references :product_type, foreign_key: true

      t.timestamps
    end
  end
end
