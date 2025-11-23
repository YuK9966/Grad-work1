class CreateNailItems < ActiveRecord::Migration[7.2]
  def change
    create_table :nail_items do |t|
      t.references :brand, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :prod_color, null: false, foreign_key: true
      t.references :colors, foreign_key: true
      t.timestamps
    end
    add_index :nail_items, [ :brand_id, :product_id, :prod_color_id ],
              unique: true,
              name: 'index_nail_items_SKU'
  end
end
