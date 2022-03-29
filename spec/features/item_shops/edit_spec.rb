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
end
