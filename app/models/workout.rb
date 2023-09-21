class Workout < ApplicationRecord
  belongs_to :location
  belongs_to :week_day
  belongs_to :sport_type
  belongs_to :licence
  validates :name, length: {maximum: 20}
  validates :location_id, presence: true
  validates :week_day_id, presence: true
  validates :sport_type_id, presence: true
end
