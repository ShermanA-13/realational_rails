class ItemShop < ApplicationRecord
  has_many :items

  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :open, in: [true, false]
end
