class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

validates :title, presence: true, length: {maximum: 60, minimum: 5}
validates :link, presence: true #, format: {with: /\A(http.|https.|www.)/, message: "Ce n'est pas un site internet"}
validates :date, presence: true
validates :user_id, presence: true
# validates :photo, presence: true

def notification?
  !Notification.where(picture_id: self.id).empty?
end

end
