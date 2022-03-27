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
end
