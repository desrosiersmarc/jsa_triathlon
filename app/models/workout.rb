class Workout < ApplicationRecord
  belongs_to :location
  belongs_to :week_day
  belongs_to :sport_type
  validates :name, presence: true, length: {maximum: 40, minimum: 5}
  validates :location_id, presence: true
  validates :week_day_id, presence: true
  validates :sport_type_id, presence: true
end
