require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :item_shop }
  end

  describe 'attributes' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :price }
    it { should allow_value([true, false]).for(:consumable) }
    it { should_not allow_value(nil).for(:consumable) }
  end

  it 'only returns consumable items' do
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

    expect(Item.only_consumables).to eq([@item2, @item3])
  end
end
