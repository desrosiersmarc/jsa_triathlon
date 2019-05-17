class AddSendEmailAdminToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :send_email_admin, :boolean, default: true
  end
end
