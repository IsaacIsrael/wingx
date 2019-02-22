class Flight < ApplicationRecord
  belongs_to :company
  has_many :orders, dependent: :destroy
  has_many :facilities, dependent: :destroy
  has_many :images, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :destiny, :description, :origin, presence: true
  validates :date, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  validates :capacity, numericality: { greater_than_or_equal_to: 1, only_integer: true }

  validate :flight_date_cant_be_in_past

  def flight_date_cant_be_in_past
    errors.add(:date, 'can\'t be in the past') if date < Date.today
  end

  def your_owner?(user)
    company.user == user
  end

  def available_set
    capacity - bought_sets
  end

  def billed
    result = bought_sets * price
    "#{price_unit} #{format('%.2f', result)}"
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

  def bought_sets
    orders.to_a.map(&:passenger_number).inject(0, :+)
  end
end
