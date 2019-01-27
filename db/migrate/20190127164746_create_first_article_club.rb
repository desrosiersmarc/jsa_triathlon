class CreateFirstArticleClub < ActiveRecord::Migration[5.1]
  def change
    Club.create! id:1, content: 'Histoire du club', user_id: User.first.id
  end
end
