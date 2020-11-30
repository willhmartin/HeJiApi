class Activity < ApplicationRecord
  validates :content, :location, :date, :time, :transportation, :lodging, presence: true

  belongs_to :trip
  belongs_to :user
end
