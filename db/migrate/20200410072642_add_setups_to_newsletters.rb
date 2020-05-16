class AddSetupsToNewsletters < ActiveRecord::Migration[5.1]
  def change
    add_column :newsletters, :send_newsletter, :boolean, default: false
    add_column :newsletters, :send_newsletter_date, :string, default: 2
  end
end
