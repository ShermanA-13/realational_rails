class ItemShopsController < ApplicationController
  def index
    @item_shops = ItemShop.all
  end
end
