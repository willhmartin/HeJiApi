class Guest < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  belongs_to :trip
end
