class Article < ApplicationRecord
  belongs_to :user
  belongs_to :article_type
  has_many :reviews
  has_many :likes
  has_many :participations
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, length: {maximum: 60, minimum: 5}
  validates :date, presence: true
  validates :article_type_id, presence: true
  validates :photo, presence: true
  validates :location, presence: true, length: {maximum: 60, minimum: 5}


  def total_likes
    sum = 0
    self.likes.each do |like|
      sum += like.like
    end
    return sum
  end

  def count_reviews
    sum = 0
    self.reviews.each do |review|
      if !review.content.nil?
        sum += 1
      end
    end
    return sum
  end
end
