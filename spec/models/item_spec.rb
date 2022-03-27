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
end
