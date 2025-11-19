class CreateLogNails < ActiveRecord::Migration[7.2]
  def change
    create_table :log_nails do |t|
      t.references :nail_item, null: false, foreign_key: true
      t.references :naillog, null: false, foreign_key: true
      t.timestamps
    end
  end
end
