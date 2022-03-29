# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
ItemShop.destroy_all

@groggy = ItemShop.create!(
  name: "Groggy's Potions and Knick Knacks",
  city: 'Akros',
  open: 'true',
  num_employees: 3
)
@perisophia = ItemShop.create!(
  name: "Perisophia's Scrolls",
  city: 'Meletis',
  open: 'false',
  num_employees: 5
)

@item = @groggy.items.create!(
  name: 'Stick',
  quantity: 26,
  price: 0.02,
  consumable: false
)
@item2 = @groggy.items.create!(
  name: 'Healing Potion',
  quantity: 12,
  price: 50.50,
  consumable: true
)
@item3 = @groggy.items.create!(
  name: 'Greater Healing Potion',
  quantity: 12,
  price: 100.23,
  consumable: true
)

@item4 = @perisophia.items.create!(
  name: 'Scroll of Minor Illusion',
  quantity: 6,
  price: 100.50,
  consumable: true
)
@item5 = @perisophia.items.create!(
  name: 'Scroll of Spiritual Weapon',
  quantity: 12,
  price: 335.68,
  consumable: true
)
@item6 = @perisophia.items.create!(
  name: 'Wand of Magic Missles',
  quantity: 2,
  price: 1205.35,
  consumable: false
)
