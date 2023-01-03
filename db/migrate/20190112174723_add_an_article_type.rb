class AddAnArticleType < ActiveRecord::Migration[5.1]
  def change
    ArticleType.create! id:1, name: 'club'
    ArticleType.create! id:2, name: 'Entrainement'
    ArticleType.create! id:3, name: 'Course'
    ArticleType.create! id:4, name: 'Ecole'
    ArticleType.create! id:5, name: 'Partenaire'
    ArticleType.create! id:6, name: 'Résultat'
    ArticleType.find(1).update(name: 'Evénement du clube')
    ArticleType.create! id:7, name: 'Clube'
  end
end
