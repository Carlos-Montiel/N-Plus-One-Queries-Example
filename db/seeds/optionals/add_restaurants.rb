# frozen_string_literal: true

Faker::Config.locale = 'es-MX'
number = 100
puts "creating #{number} owners with 3 restaurants each one..."
number.times do
  puts 'generating owner...'
  owner = Owner.create!(name: Faker::Name.unique.name, phone: Faker::PhoneNumber.unique.phone_number)

  puts 'generating owner`s 3 restaurants...'
  3.times do
    zip_code = ZipCode.find(ZipCode.ids.sample)
    Restaurant.create do |restaurant|
      restaurant.owner = owner
      restaurant.name = Faker::Restaurant.name + rand.to_s
      restaurant.restaurant_type = Faker::Restaurant.type + rand.to_s
      restaurant.description = Faker::Restaurant.description + rand.to_s
      restaurant.zip_code = zip_code
    end
  end
end
