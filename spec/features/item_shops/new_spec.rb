require 'rails_helper'

describe 'ItemShop creation' do
  it 'links to new page from item_shop#index' do
    visit '/item_shops'

    click_link 'New Item Shop'
    expect(current_path).to eq('/item_shops/new')
  end
end
