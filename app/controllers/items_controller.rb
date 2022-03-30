class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @items = Item.find(params[:id])
  end

  def new; end
end
