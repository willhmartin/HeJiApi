class Guest < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  belongs_to :trip
  has_many :budgets
end
