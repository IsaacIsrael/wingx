class Order < ApplicationRecord
  belongs_to :flight
  belongs_to :user

  validates :passenger_number, presence: true
  validate :avalible_seats

  private

  def avalible_seats
    if passenger_number && flight.available_seat < passenger_number
      errors.add(:passenger_number, "Seats is not available")
    end
  end
end
