class Facility < ApplicationRecord
  belongs_to :feature
  belongs_to :flight
end
