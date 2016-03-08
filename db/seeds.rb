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
  w = Wiki.new
  w.user = users.sample
  w.title = Faker::StarWars.character + "'s " + Faker::Beer.name
  w.body =  '**' + Faker::StarWars.quote + '** ' + Faker::Hipster.paragraph(rand(1..6)) + "\n\n" + rand(1..6).times.map { Faker::Hipster.paragraph(rand(1..10)) }.join("\n\n")
  w.private = Faker::Boolean.boolean

  w.save!
end

puts "#{Wiki.count} Wikis created"
puts "#{User.count} Users created"