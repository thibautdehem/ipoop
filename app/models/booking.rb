class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :toilet
  # validates :rating, presence: true
  # validates :review, presence: true
  validates :arrivaltime, presence: true
  validates :pooptype, presence: true
end
