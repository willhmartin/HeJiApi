class Trip < ApplicationRecord
  validates :location, :start_date, :end_date, :user_id, presence: true

  belongs_to :user

  has_many :activities, dependent: :destroy
  has_many :payments
  has_many :guests
  has_many :budgets
end
