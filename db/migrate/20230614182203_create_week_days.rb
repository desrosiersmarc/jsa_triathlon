class CreateWeekDays < ActiveRecord::Migration[6.1]
  def change
    create_table :week_days do |t|

      t.timestamps
    end
  end
end
