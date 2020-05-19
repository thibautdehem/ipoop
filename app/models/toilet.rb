class Toilet < ApplicationRecord
    belongs_to :user
    has_many :bookings
    validates :address, presence: true 
    validates :description, presence: true
    validates :style, presence: true
end
