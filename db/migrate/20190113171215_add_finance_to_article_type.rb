class AddFinanceToArticleType < ActiveRecord::Migration[5.1]
  def change
    ArticleType.create! id:8 , name: 'Finances'
  end
end
