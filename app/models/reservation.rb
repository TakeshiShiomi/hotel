class Reservation < ApplicationRecord
    belongs_to :room
    has_one_attached :image
    validates :start, presence: true
    validates :end, presence: true
    validates :person, presence: true
end
