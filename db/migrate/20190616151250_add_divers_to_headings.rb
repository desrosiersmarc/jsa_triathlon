class AddDiversToHeadings < ActiveRecord::Migration[5.1]
  def change
    ArticleType.create(name: 'Divers')
  end
end
