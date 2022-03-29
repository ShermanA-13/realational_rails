require 'rails_helper'

describe 'ItemShop creation' do
  before :each do
    @groggy = ItemShop.create!(
      name: "Groggy's Potions and Knick Knacks",
      city: 'Akros',
      open: true,
      num_employees: 3
    )
  end
  it 'links to new page from item_shop#index' do
    visit '/item_shops'

    click_link 'New Item Shop'
    expect(current_path).to eq('/item_shops/new')
  end

  it 'can create a new artist' do
    visit '/item_shops/new'

    fill_in('Name', with: "Boomba's Brews")
    fill_in('City', with: 'Akros')
    fill_in('Open', with: true)
    fill_in('Number of Employees', with: '12')
    click_button('Create Item Shop')

    expect(current_path).to eq('/item_shops')
    expect(page).to have_content("Boomba's Brews")
  end
end
