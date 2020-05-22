class Toilet < ApplicationRecord
    belongs_to :user
    has_many :bookings, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_one_attached :photo

    validates :address, presence: true
    validates :description, presence: true
    validates :style, presence: true

    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
end
