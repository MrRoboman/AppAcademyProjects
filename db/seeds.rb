# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do |i|
  user = User.create!(email: (i+1), password: ((i+1).to_s*6))
  band = Band.create!(name: Faker::Superhero.name)
  album= Album.create!(name: Faker::StarWars.droid, band: band)
  track= Track.create!(name: Faker::StarWars.character, ord: (1), album: album)
end
