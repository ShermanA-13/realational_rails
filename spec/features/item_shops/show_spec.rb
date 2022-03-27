require 'rails_helper'

RSpec.describe 'ItemShops show page' do
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

  it 'displays specific ItemShop data' do
    visit "/item_shops/#{@groggy.id}"

    save_and_open_page
    expect(page).to have_content(@groggy.name)
    expect(page).to have_content(@groggy.city)
    expect(page).to have_content(@groggy.open)
    expect(page).to have_content(@groggy.num_employees)
  end
end
