class Product < ApplicationRecord
  belongs_to :user
  belongs_to :size
  belongs_to :sport_type
  belongs_to :product_type

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, length: {maximum: 60, minimum: 5}
  validates :description, presence: true
  validates :price, presence: true
  validates :stock, presence: true
end
