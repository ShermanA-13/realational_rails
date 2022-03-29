require 'rails_helper'

RSpec.describe 'the item #index page' do
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
    visit "/items/#{@item.id}"
  end

  it 'displays specific Item data related to primary key' do
    expect(page).to have_content(@item.name)
    expect(page).to have_content(@item.quantity)
    expect(page).to have_content(@item.price)
    expect(page).to have_content(@item.consumable)
    expect(page).to_not have_content(@item2)
  end

  it 'page has clickable link that redirects to item_shops#index' do
    click_link 'Item Shops'

    expect(page).to have_link('Item Shops', href: '/item_shops')
    expect(page).to have_current_path('/item_shops')
  end
end
