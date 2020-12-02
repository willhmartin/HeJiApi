class Budget < ApplicationRecord
  validates :amount, presence: true
  belongs_to :guest
  belongs_to :trip
  has_many :payments, through: :trip
end

