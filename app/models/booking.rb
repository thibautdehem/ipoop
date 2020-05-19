class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :toilet
  validates :rating, presence: true
  validates :review, presence: true
end
