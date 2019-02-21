class Order < ApplicationRecord
  belongs_to :flight
  belongs_to :user

  # with_options if: :set_avalible? do |order|
  #   order.passenger_number = order.flight.available_seat
  # end
  # validades :passenger_number, presence: true
end
