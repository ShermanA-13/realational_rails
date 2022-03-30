require 'rails_helper'

RSpec.describe 'item#edit page' do
  before :each do
    @groggy = ItemShop.create!(
      name: "Groggy's Potions and Knick Knacks",
      city: 'Akros',
      open: 'true',
      num_employees: 3
    )

    @item1 = @groggy.items.create!(
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
  end

  it 'links to the edit page' do
    visit "/items/#{@item1.id}"

    click_link 'Update Item'

    expect(current_path).to eq("/items/#{@item1.id}/edit")
  end

  it 'can edit the item_shop.id' do
    visit "/items/#{@item1.id}/edit"

    fill_in('Name', with: 'Booze')
    fill_in('Quantity', with: '12')
    fill_in('Price', with: '00.02')
    fill_in('Consumable', with: 'true')
    click_button('Update Item')

    expect(current_path).to eq("/items/#{@item1.id}")
    expect(page).to have_content('Booze')
  end
end
