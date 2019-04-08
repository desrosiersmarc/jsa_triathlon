class ChangeColumnRatingToReviews < ActiveRecord::Migration[5.1]
  def change
    rename_column :reviews, :rating, :like
  end
end
