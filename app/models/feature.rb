class Feature < ApplicationRecord
  has_many :facilities
  validates :description, presence: true
end
