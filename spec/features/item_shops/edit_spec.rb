require 'rails_helper'

describe 'shop edit' do
  before :each do
    @shop_1 = ItemShop.create!(
      name: "Boomba's Brews",
      city: 'Akros',
      open: true,
      num_employees: 12
    )

    visit "/item_shops/#{@shop_1.id}"
  end

  it 'links to the edit page' do
    click_button "Update #{@shop_1.name}"

    expect(current_path).to eq("/item_shops/#{@shop_1.id}/edit")
  end

  it 'can edit the item_shop.id' do
    visit "/item_shops/#{@shop_1.id}/edit"

    fill_in('Name', with: 'Golden Night')
    fill_in('City', with: 'Tamberlin')
    fill_in('Open', with: 'false')
    fill_in('Number of Employees', with: '3')
    click_button('Update Item Shop')

    expect(current_path).to eq("/item_shops/#{@shop_1.id}")
    expect(page).to have_content('Golden Night')
  end
end
