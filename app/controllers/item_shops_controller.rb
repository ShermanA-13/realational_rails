class ItemShopsController < ApplicationController
  def index
    @item_shops = ItemShop.recent_order
  end

  def show
    @item_shop = ItemShop.find(params[:id])
  end

  def new; end

  def create
    item_shop = ItemShop.create!(item_shop_params)
    item_shop.save
    redirect_to '/item_shops'
  end

  def edit
    @item_shop = ItemShop.find(params[:id])
  end

  def update
    @item_shop = ItemShop.find(params[:id])
    @item_shop.update(item_shop_params)
    redirect_to "/item_shops/#{@item_shop.id}"
  end

  private

  def item_shop_params
    params.permit(:name, :city, :open, :num_employees)
  end
end
