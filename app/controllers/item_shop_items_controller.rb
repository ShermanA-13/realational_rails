class ItemShopItemsController < ApplicationController
  def index
    item_shop = ItemShop.find(params[:item_shop_id])
    @items = item_shop.items
  end
end
