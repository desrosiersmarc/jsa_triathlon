class D3Contest < ApplicationRecord
  belongs_to :contest_type

  validates :name, presence: true, length: {maximum: 60, minimum: 5}
  validates :location, presence: true, length: {maximum: 60, minimum: 5}
  validates :date, presence: true
  validates :contest_type_id, presence: true


end
