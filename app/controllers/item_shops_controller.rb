class ItemShopsController < ApplicationController
  def index
    @item_shops = ItemShop.recent_order
  end

  def show
    @item_shop = ItemShop.find(params[:id])
  end

  def new; end
end
