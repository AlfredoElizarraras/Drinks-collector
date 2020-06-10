# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |index|
  u = User.create(name: "User #{index + 1}", email: "user_#{index + 1}@mail.com", password: '123456')
  Drink.create(name: "Drink #{index + 1}", amount: 760, author_id: u.id)
  if index.odd?
    Drink.create(name: "Drink #{index + 1}.1", amount: 760, author_id: u.id)
  end
end