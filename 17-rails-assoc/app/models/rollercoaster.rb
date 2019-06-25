class Rollercoaster < ApplicationRecord
  belongs_to :park
  validates :name, :height, :location, :length, presence: true
end
