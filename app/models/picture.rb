class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

validates :title, presence: true, length: {maximum: 30, minimum: 5}
validates :link, presence: true #, format: {with: /\A(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/, message: "Ce n'est pas un site internet"}
validates :date, presence: true
validates :user_id, presence: true
validates :photo, presence: true
end
