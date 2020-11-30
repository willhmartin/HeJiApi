class Budget < ApplicationRecord
  validates :amount, presence: true
  belongs_to :user
  belongs_to :trip
  has_many :payments, through :trip
end

