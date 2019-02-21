class Flight < ApplicationRecord
  belongs_to :company
  has_many :orders, dependent: :destroy
  has_many :facilities, dependent: :destroy
  has_many :images, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :destiny, :description, :origin, presence: true
  validates :date, :capacity, :price, presence: true

  def your_owner?(user)
    company.user == user
  end

  def available_set
    capacity - bought_sets
  end

  private

  def bought_sets
    orders.to_a.map(&:passenger_number).inject(0, :+)
  end
end
