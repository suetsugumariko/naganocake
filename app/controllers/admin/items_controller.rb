class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
  end

  def new
    @items = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to '/admin/items'
  end

  def show
    @item = Item.find(params[:id])
    @item = Item.new
  end

  def edit
    @item = Itmem.find(params[:id])
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:title, :body, :image, :price, :is_active_method)
  end



end
