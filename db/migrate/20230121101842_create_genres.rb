class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|

      #ジャンルID
      t.integer:id
      #ジャンル名
      t.string:name

      t.timestamps
    end
  end
end
