require 'rails_helper'

RSpec.describe ItemShop, type: :model do
  describe 'attributes' do
    it { should be_valid }
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should allow_value(nil).for(:open) }
  end

  describe 'relationships' do
    it { should have_many :items }
  end
end
