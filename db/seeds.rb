# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

15.times do
  Campaign.create(
    title: Faker::Marketing.buzzwords,
    description: Faker::Lorem.paragraph,
    state: Campaign.states_keys.sample,
    publication_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    position: Campaign.count + 1
  )
end
