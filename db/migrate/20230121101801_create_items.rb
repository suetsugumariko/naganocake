class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      #商品ID
      # t.integer:id
      #ジャンルID
      t.integer:genre_id
      #商品名
      t.string:name
      #商品説明文
      t.text:introduction
      #税抜価格
      t.integer:price
      #販売ステータス
      t.boolean:is_active

      t.timestamps
    end
  end
end
