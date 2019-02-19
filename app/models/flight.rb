class Flight < ApplicationRecord
  belongs_to :company
  belongs_to :order
  has_many :facilities
  has_many :images
end
