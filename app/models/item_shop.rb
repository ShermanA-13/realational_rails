class ItemShop < ApplicationRecord
  has_many :items

  validates_presence_of :name
  validates_presence_of :city
  validates_inclusion_of :open, in: [true, false]

  def self.recent_order
    ItemShop.order(created_at: :desc)
  end

  def date_time
    created_at.strftime(' %I:%M%p on %m/%d/%Y')
  end

  def count_items
    Item.where(item_shop_id: id).count
  end
end
