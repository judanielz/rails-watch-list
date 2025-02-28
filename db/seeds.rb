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
puts 'Cleaning movies...'
Movie.destroy_all
puts 'Creating movies...'
10.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Lorem.sentence,
    poster_url: Faker::LoremFlickr.image(size: "300x450", search_terms: ['movie']),
    rating: rand(1...5).round(1),
  )
  movie.save!
end
