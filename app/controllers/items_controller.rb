class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @items = Item.find(params[:id])
  end

  def create
    item = Item.create!(item_params)
    item.save
    redirect_to '/items'
  end

  private

  def item_params
    params.permit(:name, :quantity, :price, :consumable, :item_shop_id)
  end
end
