class Company < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :flights

  validates :name, :cnpj, presence: true, uniqueness: true
end
