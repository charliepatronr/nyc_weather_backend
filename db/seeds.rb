# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.delete_all

cities = []

chicago = City.create(weather_id: 4887398 , name: "Chicago", state: "IL", country: "US" , lon: -87.650047 , lat: 41.850029 )
nyc = City.create(weather_id: 5128581 , name: "New York City" , state: "NY"  , country: "US" , lon: -74.005966 , lat: 40.714272)
washington = City.create(weather_id: 4140963 , name: "Washington, D.C." , state: "DC" , country: "US", lon: -77.036369 , lat: 38.895111)
ags = City.create(weather_id: 4019233 , name: "Aguascalientes" , state: "" , country: "MX" , lon: -102.300003 , lat: 21.883329 )
austin = City.create(weather_id: 4671654 , name: "Austin" , state: "TX" , country: "US", lon: -97.743057 , lat: 30.267151)


cities << chicago
cities << nyc
cities << washington
cities << ags
cities << austin

puts cities


