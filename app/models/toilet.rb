class Toilet < ApplicationRecord
    has_many :users
    belongs_to :booking
    validates :address, presence: true 
    validates :description, presence: true
    validates :style, presence: true
end
