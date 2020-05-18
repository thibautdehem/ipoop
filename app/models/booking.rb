class Booking < ApplicationRecord
  has_many :users
  has_many :toilets
end
