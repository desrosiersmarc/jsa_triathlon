class AddDiversToHeadings < ActiveRecord::Migration[5.1]
  def change
    ArticleType.create! id:9, name: 'Divers'
  end
end
