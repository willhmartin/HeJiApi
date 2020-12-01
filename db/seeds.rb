# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'

Guest.destroy_all
Activity.destroy_all
User.destroy_all
Trip.destroy_all

user1 = User.create(name: "Ara" )
user2 = User.create(name: "Will")
user3 = User.create(name: "Erica")

trip1 = Trip.create!(title: "Sanya Trip", location: "Sanya", start_date: Date.new, end_date: Date.new, user: user1)

trip2 = Trip.create(title: "New York Trip", location: "New York City", start_date: Date.new, end_date: Date.new, user: user2)

trip3 = Trip.create(title: "Patagonia Trip", location: "Chile", start_date: Date.new, end_date: Date.new, user: user3)

activity1 = Activity.create(content: "Go surfing", location: "Beach", date: Date.new, time: Time.now, transportation: "Didi", lodging: "Airbnb", user: user1, trip: trip1)

activity2 = Activity.create(content: "Theatre", location: "Broadway", date: Date.new, time: Time.now, transportation: "Taxi", lodging: "Hotel", user: user2, trip: trip2)

activity3 = Activity.create(content: "Hiking", location: "Mountain", date: Date.new, time: Time.now, transportation: "Llama", lodging: "Cabin", user: user3, trip: trip3)

guest1 = Guest.create(name: "Aggy", is_admin: false, user: user2, trip: trip2)
guest2 = Guest.create(name: "Ashkan", is_admin: false, user: user1, trip: trip2)
guest3 = Guest.create(name: "Arnaud", is_admin: false, user: user3, trip: trip2)
