puts "Clearing data..."
User.destroy_all
Game.destroy_all
Category.destroy_all

Faker::Game.unique.clear

puts "Creating users..."
10.times do
    User.create(username: Faker::Internet.username, email: Faker::Internet.email)
end

puts "Creating categories..."
categories = ["First-person shooter", "Puzzle", "Platformer", "RPG", "MMO", "Adventure"]
categories.each do |category|
    Category.create(name: category)
end

puts "Creating games..."
10.times do 
    Game.create(name: Faker::Game.unique.title, platform: Faker::Game.platform, category: Category.all.sample)
end

# TODO: Create seeds for the models/migrations you have added

puts "Creating reviews..."
5.times {
    Review.create(user: User.all.sample, game_id: Game.ids.sample, content: Faker::Lorem.sentence, rating: Faker::Number.within(range: 1..5))
}

puts "Database seeded successfully!"