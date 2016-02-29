
10.times do
Wiki.create!(

  title: "yes",
  body: "no",
  private: false

)
end

puts "#{Wiki.count} Wikis created"
