class ItemShopItemsController < ApplicationController
  def index
    @item_shop = ItemShop.find(params[:item_shop_id])
    @items = if params[:sort]
               @item_shop.sort_alpha
             else
               @item_shop.items
             end
  end
end
