class CreateNailStocks < ActiveRecord::Migration[7.2]
  def change
    create_table :nail_stocks do |t|
      t.references :nail_item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :nail_stocks, [ :nail_item_id, :user_id ], unique: true
  end
end
