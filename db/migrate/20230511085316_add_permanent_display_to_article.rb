class AddPermanentDisplayToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :permanent_display, :boolean
  end
end
