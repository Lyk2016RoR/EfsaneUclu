# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating seed data...'

Admin.create(email: "admin@admin.com", password: 123456, first_name: "Admin", last_name: "admin")

c1 = Category.create(name: 'Science Fiction')
c2 = Category.create(name: 'Action')
c3 = Category.create(name: 'Political')
c4 = Category.create(name: 'Dram')
c5 = Category.create(name: 'Love')

p1 = Publisher.create(name: 'Publisher 1', established_year: Date.yesterday, email: 'publisher1@new.com', telephone: '234 657 7887')
p2 = Publisher.create(name: 'Publisher 2', established_year: Date.yesterday, email: 'publisher2@new.com', telephone: '234 657 7887')
p3 = Publisher.create(name: 'Publisher 3', established_year: Date.yesterday, email: 'publisher3@new.com', telephone: '234 657 7887')
p4 = Publisher.create(name: 'Publisher 4', established_year: Date.yesterday, email: 'publisher4@new.com', telephone: '234 657 7887')
p5 = Publisher.create(name: 'Publisher 5', established_year: Date.yesterday, email: 'publisher5@new.com', telephone: '234 657 7887')

a1 = Author.create name: 'New Author', info: 'Info about new author.', publisher_id: p2.id
a2 = Author.create name: 'Another Author', info: 'Info about another author.', publisher_id: p1.id
a3 = Author.create name: 'New Author 2', info: 'Info about new author 2.', publisher_id: p1.id
a4 = Author.create name: 'Author abcd', info: 'Info about author abcd.', publisher_id: p5.id
a5 = Author.create name: 'Next Author', info: 'Info about next author.', publisher_id: p3.id
a6 = Author.create name: 'Seventh Author', info: 'Info about seventh author.', publisher: p4

b1 = Book.create(name: 'Suç ve Ceza', topic: 'Polisiye', year: Date.yesterday, summary: 'This is a summary about Suç ve Ceza', category_id: c4.id, photo_file_name: "distant-lights-linux-wallpaper.jpg", photo_content_type: "image/jpeg", photo_file_size: 269700, author_ids: [3])
b2 = Book.create(name: 'Savaş ve Barış', topic: 'Polisiye', year: Date.yesterday, summary: 'Summary of Savaş ve Barış', category: c3, photo_file_name: "distant-lights-linux-wallpaper.jpg", photo_content_type: "image/jpeg", photo_file_size: 269700, author_ids: [1, 4])
b3 = Book.create(name: '9. Hariciye Koğuşu', topic: 'Polisiye', year: Date.yesterday, summary: 'This is a summary about 9. Hariciye Koğuşu', category: c2, photo_file_name: "distant-lights-linux-wallpaper.jpg", photo_content_type: "image/jpeg", photo_file_size: 269700, author_ids: [2, 6])



puts 'Creaed seed data ...'
