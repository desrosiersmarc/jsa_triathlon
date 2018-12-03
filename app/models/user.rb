class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :firstname, presence: true
validates :lastname, presence: true
validates :birthday, presence: true
validates :mobil_phone, presence: true, numericality: true, length: {maximum: 13, minimum: 10 }
end
