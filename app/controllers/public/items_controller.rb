class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end



   private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :is_active, :item_id, :amount, :genre_id, :title, :body)
  end


end
