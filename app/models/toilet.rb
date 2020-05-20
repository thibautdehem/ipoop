class Toilet < ApplicationRecord
    belongs_to :user
    has_many :bookings
    has_one_attached :photo
    validates :address, presence: true
    validates :description, presence: true
    validates :style, presence: true
end
