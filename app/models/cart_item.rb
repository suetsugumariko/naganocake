class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
def subtotal
    item.with_tax_price * amount
end


 #    カートアイテムの削除
def delete_item(product_id:)
    items.find_by(product_id: product_id).destroy
end

  #    カートの合計の算出
def total_price
    items.sum("quantity*price")
end



end
