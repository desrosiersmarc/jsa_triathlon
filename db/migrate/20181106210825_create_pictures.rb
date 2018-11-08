class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :description
      t.string :link
      t.datetime :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
