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
    #カート内の同じ種類の商品をまとめて表示する
    #すでにカートにある商品がさらに追加されたときには、カートにある商品の数量を変更してupdate
    #すでにカートにある商品の情報を知るため、カートの商品を全てもってくる
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
       if cart_item.item_id == @cart_item.item_id
         #すでにカートに入れている数量と新しく追加した数量を足した数量をnew_quanitityとしてupdate
          new_amount = cart_item.amount + @cart_item.amount
          cart_item.update_attribute(:amount, new_amount)
          @cart_item.delete
       end
    end
    @cart_item.save
    redirect_to :cart_items
  end



  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
