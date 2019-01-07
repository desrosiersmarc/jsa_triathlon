class ChangeDefaultValueToArticle < ActiveRecord::Migration[5.1]
  def change
    change_column_default :articles, :article_type_id, 1
    change_column_default :articles, :active, from: false, to: true
  end
end
