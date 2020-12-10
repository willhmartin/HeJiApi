class User < ApplicationRecord
  validates :name, presence: true

  has_many :guests
  has_many :trips, through: :guests
end
