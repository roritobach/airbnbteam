# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

# TODO: Write a seed to insert 100 posts in the database

100.times do
  users = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email)
  users.save
end

100.times do
  announces = Announce.new(
    name: Faker::Name.name,
    description: Faker::Lorem.sentence)
  announces.save
end
