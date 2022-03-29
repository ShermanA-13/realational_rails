class ItemShopsController < ApplicationController
  def index
    @item_shops = ItemShop.recent_order
  end

  def show
    @item_shop = ItemShop.find(params[:id])
  end

  def new; end

  def create
    item_shop = ItemShop.create!(
      name: params[:name],
      city: params[:city],
      open: params[:open],
      num_employees: params[:num_employees]
    )
    item_shop.save
    redirect_to '/item_shops'
  end
end
