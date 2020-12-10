class Trip < ApplicationRecord
  validates :location, :start_date, :end_date, presence: true
  # has_many :users, through: :guests

  has_many :activities
  has_many :payments
  has_many :guests
  has_many :users, through: :guests
  has_many :budgets

  # def standard_hash
    
  # end
end
