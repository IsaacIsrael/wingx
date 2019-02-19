class Order < ApplicationRecord
  belongs_to :flight
  belongs_to :user

  validades :passenger_number, presence: true
end
