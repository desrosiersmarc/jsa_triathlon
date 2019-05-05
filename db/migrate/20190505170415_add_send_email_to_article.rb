class AddSendEmailToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :send_email, :boolean, default: false
  end
end
