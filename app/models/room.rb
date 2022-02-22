class Room < ApplicationRecord
    has_one_attached :image
    belongs_to :user #UserモデルとRoomモデルに1対多の関連
    has_many :reservations #RoomモデルとReservationモデルに1対多の関連
    validates :name, presence: true
    validates :address, presence: true
    validates :charge, numericality: true
    validates :introduction, presence: true
    validates :image, presence: true
end
