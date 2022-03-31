require 'rails_helper'

RSpec.describe ItemShop, type: :model do
  describe 'attributes' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should allow_value([true, false]).for(:open) }
    it { should_not allow_value(nil).for(:open) }
  end

  describe 'relationships' do
    it { should have_many :items }
  end

  describe 'methods' do
    before :each do
      @groggy = ItemShop.create!(
        name: "Groggy's Potions and Knick Knacks",
        city: 'Akros',
        open: 'true',
        num_employees: 3
      )
      @item3 = @groggy.items.create!(
        name: 'Greater Healing Potion',
        quantity: 12,
        price: 100.23,
        consumable: true
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

      @perisophia = ItemShop.create!(
        name: "Perisophia's Scrolls",
        city: 'Meletis',
        open: 'false',
        num_employees: 5
      )
      @item6 = @perisophia.items.create!(
        name: 'Wand of Magic Missles',
        quantity: 2,
        price: 1205.35,
        consumable: false
      )
      @item8 = @perisophia.items.create!(
        name: 'Scroll of Minor Illusion',
        quantity: 6,
        price: 100.50,
        consumable: true
      )

      @golden = ItemShop.create!(
        name: 'Golden Night',
        city: 'Tamberlin',
        open: 'false',
        num_employees: 5
      )
      @item5 = @golden.items.create!(
        name: 'Mead',
        quantity: 45,
        price: 0.02,
        consumable: true
      )
      @item7 = @golden.items.create!(
        name: 'Ale',
        quantity: 45,
        price: 0.01,
        consumable: true
      )
      @item4 = @golden.items.create!(
        name: 'Fire Water',
        quantity: 45,
        price: 0.05,
        consumable: true
      )
    end

    it 'orders ItemShops by #created_at' do
      expect(ItemShop.recent_order).to eq([@golden, @perisophia, @groggy])
    end

    it 'displays #created_at in a readable format' do
      date = Time.now.utc
      expect(@groggy.date_time).to eq(date.strftime(' %I:%M%p on %m/%d/%Y'))
    end

    it 'counts items in ItemShop' do
      expect(@groggy.count_items).to eq(3)
      expect(@perisophia.count_items).to eq(2)
      expect(@golden.count_items).to eq(3)
    end

    it 'sorts items in Itemshops by #sort.alpha' do
      expect(@groggy.sort_alpha).to eq([@item3, @item2, @item1])
    end
  end
end
