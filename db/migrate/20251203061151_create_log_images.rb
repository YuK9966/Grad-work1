class CreateLogImages < ActiveRecord::Migration[7.2]
  def change
    create_table :log_images do |t|
      t.references :naillog, null: false, foreign_key: true
      t.string :image_url, null: false

      t.timestamps
    end
    add_index :log_images, :image_url, unique: true
  end
end
