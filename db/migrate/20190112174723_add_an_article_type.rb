class AddAnArticleType < ActiveRecord::Migration[5.1]
  def change
    ArticleType.find(1).update(name: 'Evénement du clube')
    ArticleType.create! id:7, name: 'Clube'
  end
end
