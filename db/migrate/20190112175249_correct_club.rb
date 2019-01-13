class CorrectClub < ActiveRecord::Migration[5.1]
  def change
    ArticleType.find(1).update(name: 'Evénement du club')
    ArticleType.find(7).update(name: 'Le club')
  end
end
