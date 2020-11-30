class Payment < ApplicationRecord
  validates :amount, :category, presence: true

  belongs_to :trip
end
