# Clear existing data
puts "Clearing existing data..."
GameStore.clear_all

# Create sample game
puts "Creating sample game..."
game = GameStore.create_game(
  candidate_name: "Sarah Johnson",
  candidate_photo: "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=400&h=400&fit=crop&crop=face",
  statements_attributes: [
    {
      content: "I once climbed Mount Kilimanjaro in Tanzania and reached the summit at 19,341 feet.",
      is_truth: true
    },
    {
      content: "I can speak 7 different languages fluently including Mandarin Chinese and Arabic.",
      is_truth: false  # This is the lie
    },
    {
      content: "I've published 3 children's books that have been translated into 12 languages.",
      is_truth: true
    }
  ]
)

# Create some sample votes
puts "Creating sample votes..."
employee_names = ["Alex Chen", "Maria Rodriguez", "David Kim", "Lisa Thompson", "James Wilson", "Emma Davis"]

employee_names.each do |employee_name|
  # Randomly select a statement to vote for
  random_statement = game.statements.sample
  game.add_vote(employee_name, random_statement[:id])
end

puts "Seed data created successfully!"
puts "Game: #{game.candidate_name}"
puts "Game Code: #{game.token}"
puts "Statements: #{game.statements.count}"
puts "Votes: #{game.votes.count}"
puts "Shareable Link: http://localhost:3000/#{game.token}"
puts "Visit http://localhost:3000 to see the game!"
