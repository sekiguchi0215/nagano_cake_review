class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :making_status, null: false, default: 0

      # making_statusは製作ステータスを表す。

      t.timestamps
    end
    add_index :order_details, [:order_id, :item_id], unique: true

    # "order_id"と"item_id"の組み合わせが重複しないように制約を設ける。
  end
end
