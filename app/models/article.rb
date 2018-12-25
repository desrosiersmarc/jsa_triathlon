class Article < ApplicationRecord
  belongs_to :user
  belongs_to :article_type
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, length: {maximum: 50, minimum: 5}
  validates :date, presence: true
  validates :article_type_id, presence: true
  validates :photo, presence: true
end
