require 'rails_helper'

RSpec.describe 'items#new page' do
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

    visit "/item_shops/#{@groggy.id}/items"
  end

  it 'has a link to create a new item' do
    expect(page).to have_link('New Item')
  end

  it 'links to item_shop/#{item_shop.id}/item#new' do
    click_link 'New Item'

    expect(current_path).to eq("/item_shops/#{@groggy.id}/items/new")
  end

  it 'can create a new item shop' do
    click_link 'New Item'

    fill_in('Name', with: 'Ale')
    fill_in('Quantity', with: '99')
    fill_in('Price', with: '00.01')
    fill_in('Consumable', with: 'true')
    click_button('Generate')

    expect(current_path).to eq("/item_shops/#{@groggy.id}/items")
    expect(page).to have_content('Ale')
  end
end
