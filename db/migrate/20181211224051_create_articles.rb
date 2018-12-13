class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.datetime :date
      t.time :start_time
      t.time :end_time
      t.string :location
      t.string :link
      t.string :content
      t.references :user, foreign_key: true
      t.references :article_type, foreign_key: true

      t.timestamps
    end
  end
end
