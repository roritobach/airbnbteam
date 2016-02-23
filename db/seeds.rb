# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

# TODO: Write a seed to insert 100 posts in the database
User.destroy_all
Announce.destroy_all

10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "88888888")
  user.save!


  10.times do
    announce = Announce.new(
      name: Faker::Name.name,
      description: Faker::Lorem.sentence)
    announce.user = user
    announce.save!

  end

end

puts "create #{User.count} users"
puts "create #{Announce.count} announces"
