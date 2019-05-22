class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader

  has_many :reviews
  has_many :likes
  has_many :authors
  has_many :articles, through: :authors, source: :articles #TODO
  has_many :participations


  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :mobil_phone, presence: true, numericality: true, length: {maximum: 13, minimum: 10 }

  def nb_contests(calculation_period)
    sum = 0
    self.authors.each do |author|
      if author.article.article_type_id == 3
        if author.article.updated_at > calculation_period
          sum += 1
        end
      end
    end
    return sum
  end
end
