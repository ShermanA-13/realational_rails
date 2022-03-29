require 'rails_helper'

describe 'ItemShop creation' do
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
