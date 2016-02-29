require 'faker'


10.times do |n|
  w = Wiki.new
  w.title = Faker::Beer.name
  w.body =  Faker::StarWars.character
  w.private = Faker::Boolean.boolean

  w.save
end

puts "#{Wiki.count} Wikis created"
