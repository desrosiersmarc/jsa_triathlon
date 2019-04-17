class AddReferencesToLike < ActiveRecord::Migration[5.1]
  def change
    add_reference :likes, :article, foreign_key: true
    add_reference :likes, :user, foreign_key: true
  end
end
