# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
icons = %w(https://img.icons8.com/color/48/000000/wine-bottle.png 
            https://img.icons8.com/cotton/64/000000/liquor-shelf--v2.png
            https://img.icons8.com/ultraviolet/40/000000/coffee-pot.png
            https://img.icons8.com/plasticine/100/000000/beer.png
            https://img.icons8.com/ios/64/000000/vodka-shot.png
            https://img.icons8.com/cute-clipart/64/000000/wine.png
            https://img.icons8.com/dusk/64/000000/wine-glass.png
            https://img.icons8.com/plasticine/100/000000/bottle-of-water.png
            https://img.icons8.com/dusk/64/000000/juice-bottle.png
            https://img.icons8.com/cotton/64/000000/soda-water--v1.png
          )
10.times do |index|
  u = User.create(name: "User #{index + 1}", email: "user_#{index + 1}@mail.com", password: '123456')
  g1 = Group.create(name: "User #{index + 1} Group first", icon: icons[index], user_id: u.id)
  g2 = Group.create(name: "User #{index + 1} Group second", icon: icons[index + 1], user_id: u.id)
  Drink.create(name: "User #{index + 1} Drink 1", amount: 760, author_id: u.id, group_id: g1.id)
  Drink.create(name: "User #{index + 1} Drink 1.1", amount: 760, author_id: u.id, group_id: g1.id)
  Drink.create(name: "User #{index + 1} Drink 2", amount: 1200, author_id: u.id)
  Drink.create(name: "User #{index + 1} Drink 3", amount: 350, author_id: u.id, group_id: g2.id)
  Drink.create(name: "User #{index + 1} Drink 3.1", amount: 350, author_id: u.id, group_id: g2.id)
  Drink.create(name: "User #{index + 1} Drink 4", amount: 760, author_id: u.id)
end
