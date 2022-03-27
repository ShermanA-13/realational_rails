require 'rails_helper'

RSpec.describe 'the item shops show page' do
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
  end

  it 'displays an item shop' do
    visit '/item_shops'
    # save_and_open_page
    expect(page).to have_content(@groggy.name)
    expect(page).to have_content(@perisophia.name)
  end
end
