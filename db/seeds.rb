# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating seed data...'

p1 = Book.create(name: 'Suç ve Ceza', topic: 'Polisiye', year: Date.yesterday)
p2 = Book.create(name: 'Savaş ve Barış', topic: 'Polisiye', year: Date.yesterday)
p3 = Book.create(name: '9. Hariciye Koğuşu', topic: 'Polisiye', year: Date.yesterday)


puts 'Creaed seed data ...'
