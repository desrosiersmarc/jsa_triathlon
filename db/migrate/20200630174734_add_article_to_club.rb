class AddArticleToClub < ActiveRecord::Migration[5.1]
  def change
    Club.create(id:6, content:'To be define', user_id: User.first.id, subject: 'Le mot du président')
  end
end
