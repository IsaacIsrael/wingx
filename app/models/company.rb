class Company < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :name, :cnpj, presence: true, uniqueness: true
end
