class D3Result < ApplicationRecord
  belongs_to :user
  belongs_to :d3_contest

  validates :d3_contest_id, presence: true
  validates :user_id, presence: true
  validates :rank, presence: true
  validates :swim, presence: true
  validates :t1, presence: true
  validates :bike, presence: true
  validates :t2, presence: true
  validates :run, presence: true
  validates :total, presence: true
end
