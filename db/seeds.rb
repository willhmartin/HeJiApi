# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'
tomorrow = Date.today + 1
dayafter = Date.today + 2
Budget.destroy_all
Payment.destroy_all
Guest.destroy_all
Activity.destroy_all
User.destroy_all
Trip.destroy_all
t = Time.now

user1 = User.create(name: "Ara" )
user2 = User.create(name: "Will")
user3 = User.create(name: "Erica")

trip1 = Trip.create!(title: "Sanya Trip", location: "Sanya", start_date: Date.today, end_date: Date.today, user: user1)

trip2 = Trip.create(title: "New York Trip", location: "New York City", start_date: Date.today, end_date: Date.today, user: user2)

trip3 = Trip.create(title: "Patagonia Trip", location: "Chile", start_date: Date.today, end_date: Date.today, user: user3)

activity1 = Activity.create(content: "Go surfing", location: "Beach", date: dayafter, time: Time.now, transportation: "Didi", lodging: "Airbnb", user: user1, trip: trip1)

activity2 = Activity.create(content: "Theatre", location: "Broadway", date: Date.today, time: Time.now, transportation: "Taxi", lodging: "Hotel", user: user2, trip: trip2)

activity3 = Activity.create(content: "Hiking", location: "Mountain", date: Date.today, time: Time.now, transportation: "Llama", lodging: "Cabin", user: user3, trip: trip3)

activity4 = Activity.create(content: "Guided meditation", location: "Monastery", date: Date.today, time: Time.now, transportation: "Bus", lodging: "Monastery", user: user3, trip: trip3)

activity5 = Activity.create(content: "Wine tasting", location: "Vineyard", date: Date.today, time: Time.now, transportation: "Bus", lodging: "Hoetl", user: user3, trip: trip1)

activity6 = Activity.create(content: "Volunteering", location: "Hospital", date: Date.today, time: Time.now, transportation: "Ambulance", lodging: "Ward", user: user3, trip: trip1)

activity7 = Activity.create(content: "Opera", location: "Opera house", date: tomorrow, time: Time.now, transportation: "Bus", lodging: "Hotel", user: user3, trip: trip1)

guest1 = Guest.create(name: "Aggy", is_admin: false, user: user2, trip: trip2)
guest2 = Guest.create(name: "Ashkan", is_admin: false, user: user1, trip: trip2)
guest3 = Guest.create(name: "Arnaud", is_admin: false, user: user3, trip: trip2)

payment1 = Payment.create(amount: 5000, category: "food", content: "group dinner at a beach.", trip: trip1)
payment2 = Payment.create(amount: 7000, category: "hotel", content: "three day hotel rooms", trip: trip2)

budget1 = Budget.create(amount: 200, guest: guest1, trip: trip1)
budget2 = Budget.create(amount: 600, guest: guest2, trip: trip2)



