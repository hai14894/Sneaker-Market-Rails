# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
states = ["NSW", "VIC","QLD", "WA", "TAS", "SA"]
states.each do |name|
    Location.create(state: name)
    puts "#{name} created"
end

sizes = *(4..12)
sizes.each do |s| 
    Size.create(size: s)
    puts " size #{s} created"
end