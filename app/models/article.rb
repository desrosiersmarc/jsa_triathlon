class Article < ApplicationRecord
  belongs_to :user
  belongs_to :article_type
  has_many :reviews
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, length: {maximum: 60, minimum: 5}
  validates :date, presence: true
  validates :article_type_id, presence: true
  validates :photo, presence: true
  validates :location, length: {maximum: 60, minimum: 5}

end
