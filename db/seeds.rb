require 'faker'

# Create Users
5.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

# Create an admin user
unless User.find_by(email: 'admin@example.com')
  admin = User.new(
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
  )
  admin.skip_confirmation!
  admin.save!
end

users = User.all


100.times do
  owner = users.sample
  w = Wiki.new
  w.user = owner
  w.user_ids = rand(0..10).times.map { (users - [owner]).sample.id }
  w.title = Faker::Beer.name
  w.body =  Faker::StarWars.character + Faker::StarWars.quote + Faker::Hipster.paragraph(rand(1..6)) + "\n" + rand(1..6).times.map { Faker::Hipster.paragraph(rand(1..10)) }.join("\n")
  w.private = Faker::Boolean.boolean

  w.save!
end

puts "#{Wiki.count} Wikis created"
puts "#{User.count} Users created"
