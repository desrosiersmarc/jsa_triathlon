class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader

  has_many :reviews
  has_many :likes
  has_many :articles

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :mobil_phone, presence: true, numericality: true, length: {maximum: 13, minimum: 10 }
end
