class RenamePermanentDisplayToArticle < ActiveRecord::Migration[6.1]
  def change
    change_table :articles do |t|
      t.rename :permanent_display, :pinned_article
    end 

  end
end
