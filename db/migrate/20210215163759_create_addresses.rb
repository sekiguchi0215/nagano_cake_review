class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :custromer_id, null: false
      t.string :postal_code, null: false
      t.string :destination, null: false
      t.string :name, null: false
      
      # "null: false"は空の情報を保存できないようにする為に記載している。データベースに対しての設定。
      # "presence: true"はRails側の設定。

      t.timestamps
    end
  end
end
