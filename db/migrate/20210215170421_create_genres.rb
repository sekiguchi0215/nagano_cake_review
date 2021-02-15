class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.boolean :is_active, null: false, default: true

      # "boolean型"のカラムを追加する際には、必ずデフォルト値を設定しておくべき。
      # "default: true"はデフォルト値を"true"に設定している。対に、"default: false"がある。

      t.timestamps
    end
    add_index :genres, :name, unique: true

    # "name"が重複しないように制約を設ける。
  end
end
