class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

validates :title, presence: true, length: {maximum: 30, minimum: 5}
validates :link, presence: true #TODO validate the format
validates :date, presence: true
validates :user_id, presence: true
validates :photo, presence: true
end
