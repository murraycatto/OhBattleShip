class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  has_many :Nukes
  has_many :ShipsSunk
end
