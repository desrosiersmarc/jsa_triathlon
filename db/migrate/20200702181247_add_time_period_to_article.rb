class AddTimePeriodToArticle < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :time_period, foreign_key: true
  end
end
