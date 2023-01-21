class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|


      #注文ID
      t.integer:id
      #会員ID
      t.integer:customer_id
      #配送先郵便番号
      t.string:postal_code
      #配送先住所
      t.string:address
      #配送先宛名
      t.string:name
      #送料
      t.integer:shipping_cost
      #請求額
      t.integer:total_payment
      #支払い方法
      t.integer:payment_method
      #受注ステータス
      t.integer:status



      t.timestamps
    end
  end
end
