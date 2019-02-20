class Image < ApplicationRecord
  belongs_to :flight

  # validades :image_url, presence: true
end
