class Flight < ApplicationRecord
  belongs_to :company
  has_many :orders
  has_many :facilities
  has_many :images

  mount_uploader :photo, PhotoUploader

  validates :destiny, :description, :origin, presence: true
  validates :date, :capacity, :price, presence: true

  def your_owner?(user)
    company.user == user
  end

  def available_set
    capacity - bought_sets
  end

  def price_string
    "#{price_unit} #{format('%.2f', price)}"
  end

  def price_unit
    "R$"
  end

  def flight_date
    date.strftime("%d/%m/%Y")
  end

  def route
    "#{origin} - #{destiny}"
  end

  private

  def bought_sets
    orders.to_a.map(&:passenger_number).inject(0, :+)
  end
end
