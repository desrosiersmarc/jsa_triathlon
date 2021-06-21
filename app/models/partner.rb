class Partner < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true#, length {maximum: 40, minimum: 3}
  validates :contact, presence: true#, length {maximum: 60, minimum: 5}
  validates :offer, presence: true#, length {maximum: 100}
  validates :address, presence: true
  validates :description, presence: true

  #TODO add picture and active:boolean
end
