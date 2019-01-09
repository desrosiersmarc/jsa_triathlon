class Product < ApplicationRecord
  belongs_to :user
  belongs_to :size
  belongs_to :sport_type
  belongs_to :product_type
end
