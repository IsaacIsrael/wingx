class Company < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :orders, trought: :flights, dependent: :destroy
  has_many :flights, dependent: :destroy

  validates :user, uniqueness: true
  validates :name, presence: true,
                   uniqueness: true
  validates :cnpj, presence: true,
                   uniqueness: true,
                   format: {
                     with: /\A([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})
\z/,
                     message: "Invalid"
                   }
end
