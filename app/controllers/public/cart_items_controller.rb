class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
    #@cart_item = current_customer.cart_item.build(cart_item_params)
    #@cart_items = current_customer.cart_items.all
    #@cart_items.each do |cart_item|
   #if cart_item.item_id == @cart_item.item_id

   #end
  #end
  end



  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
