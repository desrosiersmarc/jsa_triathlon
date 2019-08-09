class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :article_id
      t.integer :picture_id
      t.integer :product_id
      t.boolean :read
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
