# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Review.destroy_all
Bookmark.destroy_all
Booking.destroy_all
Space.destroy_all
User.destroy_all

def random_user
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone
  )
end

def random_space(user)
  space = Space.new(
    name: Faker::Name.name,
    description: Faker::Hipster.sentence(word_count: 8),
    address: Faker::Address.street_address,
    price: rand(30..100),
    features: "fire pit, picnic table, restrooms",
    user: user
  )
  image_path = Rails.root.join("app/assets/images/image1.jpg").open
  space.image.attach( io: image_path, filename:"image1.jpg")
  space.save

  return space
end

def random_booking(space, user)
  starting_date = Faker::Date.between(from: '2023-11-01', to: '2023-11-30')
  end_date = Faker::Date.between(from: '2023-11-01', to: '2023-11-30')
  num_days = (end_date - starting_date).to_i

  Booking.create!(
    total_price: space.price * num_days,
    starting_date: starting_date,
    end_date: end_date,
    user: user,
    space: space
  )
end

def random_bookmark(space, user)
  Bookmark.create!(
    user: user,
    space: space
  )
end

def random_review(space, user)
  Review.create!(
    rating: rand(1..5),
    comment: Faker::Lorem.sentence(word_count: 8),
    user: user,
    space: space
  )
end

10.times { random_user }

User.all.each do |user|
  rand(1..3).times do
    space = random_space(user)

    rand(0..2).times do
      other_user = User.where.not(id: user.id).sample

      random_booking(space, other_user)
      random_bookmark(space, other_user)
      random_review(space, other_user)
    end
  end
end
