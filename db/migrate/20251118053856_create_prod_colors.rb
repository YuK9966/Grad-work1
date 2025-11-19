class CreateProdColors < ActiveRecord::Migration[7.2]
  def change
    create_table :prod_colors do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
