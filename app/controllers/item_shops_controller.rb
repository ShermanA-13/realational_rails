class ItemShopsController < ApplicationController
  def index
    @item_shops = ItemShop.all
  end

  def show
    @item_shop = ItemShop.find(params[:id])
  end
end
