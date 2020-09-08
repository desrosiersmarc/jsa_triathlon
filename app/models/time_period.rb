class TimePeriod < ApplicationRecord
  has_many :articles
  has_ancestry
end
