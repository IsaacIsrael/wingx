class Order < ApplicationRecord
  belongs_to :flight
  belongs_to :user

  validates :passenger_number, presence: true
  validate :avalible_sets

  private

  def avalible_sets
    if passenger_number && flight.available_set < passenger_number
      errors.add(:passenger_number, "Sets is not avlible")
    end
  end
end
