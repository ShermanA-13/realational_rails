require 'rails_helper'

RSpec.describe ItemShop, type: :model do
  describe 'relationships' do
    it { should have_many :items }
  end
end
