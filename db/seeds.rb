require 'faker'

# Create Users
20.times do
  user = User.new(
    name:     Faker::StarWars.character,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

# Create an admin user
unless User.find_by(email: 'admin@example.com')
  admin = User.new(
    name:     'joe smith',
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
  )
  admin.skip_confirmation!
  admin.save!
end
# Create an premium user
unless User.find_by(email: 'premium@example.com')
  premium = User.new(
    email:    'premium@example.com',
    password: 'helloworld',
    role:     'premium'
  )
  premium.skip_confirmation!
  premium.save!
end

# Create an standard user
unless User.find_by(email: 'standard@example.com')
  standard = User.new(
    email:    'standard@example.com',
    password: 'helloworld',
    role:     'standard'
  )
  standard.skip_confirmation!
  standard.save!
end

users = User.all

100.times do
  owner = users.sample
  w = Wiki.new
  w.user = users.sample
  w.title = Faker::StarWars.character + "'s " + Faker::Beer.name
  w.body =  '**' + Faker::StarWars.quote + '** ' + Faker::Hipster.paragraph(rand(1..6)) + "\n\n" + rand(1..6).times.map { Faker::Hipster.paragraph(rand(1..10)) }.join("\n\n")

  w.user = owner
  w.user_ids = rand(0..10).times.map { (users - [owner]).sample.id }
  w.title = Faker::Beer.name
  w.body =  Faker::StarWars.character + Faker::StarWars.quote + Faker::Hipster.paragraph(rand(1..6)) + "\n" + rand(1..6).times.map { Faker::Hipster.paragraph(rand(1..10)) }.join("\n")
  w.private = Faker::Boolean.boolean

  w.save!
end

puts "#{Wiki.count} Wikis created"
puts "#{User.count} Users created"
