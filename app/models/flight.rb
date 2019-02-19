class Flight < ApplicationRecord
  belongs_to :company
  has_many :orders
  has_many :facilities
  has_many :images

  validates :destiny, :description, :origin, presence: true
  validates :date, :capacity, :price, presence: true
end
