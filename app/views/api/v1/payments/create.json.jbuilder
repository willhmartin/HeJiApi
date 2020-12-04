json.extract! @payment, :amount, :category, :content, :date, :split
json.budget do
  json.budgets @payment.trip.budgets
end
