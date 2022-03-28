require 'rails_helper'

RSpec.describe 'item shops #index page' do
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

    visit '/item_shops'
  end

  describe "when I visit 'item_shop#index'" do
    it 'displays an item shop' do
      expect(page).to have_content(@groggy.name)
      expect(page).to have_content(@perisophia.name)
    end

    it 'item_shops are ordered by recently created' do
      expect(@perisophia.name).to appear_before(@groggy.name)
    end

    it 'displays created_at next to each object in readable format' do
      # save_and_open_page
      expect(page).to have_content(@groggy.date_time)
      expect(page).to have_content(@perisophia.date_time)
    end

    it 'page has clickable link that redirects to item_shops#index' do
      click_link 'Item Shops'

      expect(page).to have_link('Item Shops', href: '/item_shops')
      expect(page).to have_current_path('/items_shops')
    end
  end
end
