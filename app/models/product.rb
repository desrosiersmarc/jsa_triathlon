class Product < ApplicationRecord
  belongs_to :user
  belongs_to :size
  belongs_to :sport_type
  belongs_to :product_type

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, length: {maximum: 40, minimum: 5}
  validates :description, presence: true, length: {maximum: 350, minimum: 5}
  validates :price, presence: true
  # validates :stock, presence: true

  def notification?
    !Notification.where(product_id: self.id).empty?
  end
end
