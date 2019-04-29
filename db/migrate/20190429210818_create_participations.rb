class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
