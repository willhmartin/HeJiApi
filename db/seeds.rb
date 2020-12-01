# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'

User.destroy_all
Trip.destroy_all
Budget.destroy_all

user1 = User.create(name: "Ara" )
user2 = User.create(name: "Will")
user3 = User.create(name: "Erica")


trip1 = Trip.create!(title: "Sanya Trip", location: "Sanya", start_date: Date.new, end_date: Date.new, user: user1)
trip2 = Trip.create(title: "New York Trip", location: "New York City", start_date: Date.new, end_date: Date.new, user: user2)


payment1 = Payment.create(amount: 5000, category: "food", content: "group dinner at a beach.", trip: trip1)
payment2 = Payment.create(amount: 7000, category: "hotel", content: "three day hotel rooms", trip: trip2)

budget1 = Budget.create(amount: 200, trip: trip1)
budget2 = Budget.create(amount: 600, trip: trip2)






