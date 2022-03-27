require 'rails_helper'

RSpec.describe 'the item shops show page' do
  before :each do
    @item = Item.create!(
      name: 'Stick',
      quantity: 26,
      price: 0.02,
      consumable: false
    )
    @item2 = Item.create!(
      name: 'Healing Potion',
      quantity: 12,
      price: 50.50,
      consumable: true
    )
    @item3 = Item.create!(
      name: 'Greater Healing Potion',
      quantity: 12,
      price: 100.23,
      consumable: true
    )

    @item4 = Item.create!(
      name: 'Scroll of Minor Illusion',
      quantity: 6,
      price: 100.50,
      consumable: true
    )
    @item5 = Item.create!(
      name: 'Scroll of Spiritual Weapon',
      quantity: 12,
      price: 335.68,
      consumable: true
    )
    @item6 = Item.create!(
      name: 'Wand of Magic Missles',
      quantity: 2,
      price: 1205.35,
      consumable: false
    )
  end

  it 'displays an item shop' do
    visit '/items/#index'
    save_and_open_page
    expect(page).to have_content(@item.name)
    expect(page).to have_content(@item2.name)
    expect(page).to have_content(@item3.name)
    expect(page).to have_content(@item4.name)
    expect(page).to have_content(@item5.name)
    expect(page).to have_content(@item6.name)
  end
end
