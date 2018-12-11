class Article < ApplicationRecord
  belongs_to :user
  belongs_to :article_type
end
