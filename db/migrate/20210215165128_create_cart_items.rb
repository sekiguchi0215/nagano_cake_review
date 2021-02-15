class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id, null: false
      t.integer :item_id, null: false
      t.integer :amount, null: false

      t.timestamps
    end
    add_index :cart_items, [:customer_id, :item_id], unique: true

    # "customer_id"と"item_id"の組み合わせが重複しないように制約を設ける。
  end
end
