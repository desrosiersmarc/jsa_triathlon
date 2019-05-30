class AddMailingGroupToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :mailing_group, :integer, default: 2
  end
end
