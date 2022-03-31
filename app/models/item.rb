class Item < ApplicationRecord
  belongs_to :item_shop

  validates_presence_of :name
  validates_presence_of :quantity
  validates_presence_of :price
  validates_inclusion_of :consumable, in: [true, false]

  def self.only_consumables
    Item.where(consumable: true)
  end
end
