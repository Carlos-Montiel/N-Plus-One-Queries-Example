# frozen_string_literal: true

require 'csv'

puts 'Importing states...'
CSV.foreach(Rails.root.join('db/seeds/states.csv'), headers: true) do |row|
  State.create! do |state|
    state.id = row[0]
    state.name = row[1]
  end
end

puts 'Importing municipalities...'
CSV.foreach(Rails.root.join('db/seeds/municipalities.csv'), headers: true) do |row|
  Municipality.create! do |municipality|
    municipality.state_id = row[0]
    municipality.name = row[1]
  end
end

puts 'Importing zip codes...'
CSV.foreach(Rails.root.join('db/seeds/zip_codes.csv'), headers: true) do |row|
  ZipCode.create! do |zip_code|
    zip_code.municipality_id = row[0]
    zip_code.name = row[1]
  end
end

puts 'Importing first owners and restaurants...'
3.times do
  owner = Owner.create!(name: Faker::Name.unique.name, phone: Faker::PhoneNumber.unique.phone_number)

  3.times do
    zip_code = ZipCode.find(ZipCode.ids.sample)
    Restaurant.create do |restaurant|
      restaurant.owner = owner
      restaurant.name = Faker::Restaurant.unique.name
      restaurant.restaurant_type = Faker::Restaurant.unique.type
      restaurant.description = Faker::Restaurant.unique.description
      restaurant.zip_code = zip_code
    end
  end
end