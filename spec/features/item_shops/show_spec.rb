require 'rails_helper'

RSpec.describe 'ItemShops #show page' do
  before :each do
    @groggy = ItemShop.create!(
      name: "Groggy's Potions and Knick Knacks",
      city: 'Akros',
      open: true,
      num_employees: 3
    )
    @perisophia = ItemShop.create!(
      name: "Perisophia's Scrolls",
      city: 'Meletis',
      open: false,
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

    visit "/item_shops/#{@groggy.id}"
  end

  it 'displays groggy ItemShop data' do
    expect(page).to have_content(@groggy.name)
    expect(page).to have_content(@groggy.city)
    expect(page).to have_content(@groggy.open)
    expect(page).to have_content(@groggy.num_employees)
    expect(page).to have_content("Number of Items: #{@groggy.count_items}")
    expect(page).to_not have_content(@perisophia.name)
  end

  it 'displays perisophia ItemShop data' do
    visit "/item_shops/#{@perisophia.id}"

    expect(page).to have_content(@perisophia.name)
    expect(page).to have_content(@perisophia.city)
    expect(page).to have_content(@perisophia.open)
    expect(page).to have_content(@perisophia.num_employees)
    expect(page).to have_content("Number of Items: #{@perisophia.count_items}")
    expect(page).to_not have_content(@groggy.name)
  end

  it 'page has clickable link that redirects to item_shops#index' do
    click_link 'Item Shops'

    expect(page).to have_link('Item Shops', href: '/item_shops')
    expect(page).to have_current_path('/item_shops')
  end

  it 'page has clickable link that redirects to item#index' do
    click_link 'Items'

    expect(page).to have_link('Items', href: '/items')
    expect(page).to have_current_path('/items')
  end
end
