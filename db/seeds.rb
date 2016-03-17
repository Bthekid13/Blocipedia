require 'faker'

# Create Users
5.times do
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
    name:     'Donald Trump',
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
  )
  admin.skip_confirmation!
  admin.save!
end


5.times do
  t = Topic.new
  t.title = Faker::Beer.name
  t.body = Faker::StarWars.quote

  t.save!
end

topics = Topic.all

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
puts "#{Topic.count} Topics created"
