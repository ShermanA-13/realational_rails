require 'rails_helper'

RSpec.describe 'the item shops show page' do
  before :each do
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

    @stick = @groggy.items.create!(
      name: 'Stick',
      quantity: 26,
      price: 0.02,
      consumable: false
    )
    @healing = @groggy.items.create!(
      name: 'Healing Potion',
      quantity: 12,
      price: 50.50,
      consumable: true
    )
    @greater_healing = @groggy.items.create!(
      name: 'Greater Healing Potion',
      quantity: 12,
      price: 100.23,
      consumable: true
    )

    @minor_illusion = @perisophia.items.create!(
      name: 'Scroll of Minor Illusion',
      quantity: 6,
      price: 100.50,
      consumable: true
    )
    @spiritual_weapon = @perisophia.items.create!(
      name: 'Scroll of Spiritual Weapon',
      quantity: 12,
      price: 335.68,
      consumable: true
    )
    @wand_of_magic_missles = @perisophia.items.create!(
      name: 'Wand of Magic Missles',
      quantity: 2,
      price: 1205.35,
      consumable: false
    )
  end

  it 'displays an item shop' do
    visit '/item_shops/#index'
    save_and_open_page
    expect(page).to have_content(@groggy.name)
  end
end
