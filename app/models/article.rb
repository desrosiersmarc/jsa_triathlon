class Article < ApplicationRecord
  belongs_to :user
  belongs_to :article_type

  validates :name, presence: true, length: {maximum: 30, minimum: 10}
  validates :date, presence: true
  validates :article_type_id, presence: true
end
