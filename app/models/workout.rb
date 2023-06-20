class Workout < ApplicationRecord
  belongs_to :location
  belongs_to :week_day
  belongs_to :sport_type
end
