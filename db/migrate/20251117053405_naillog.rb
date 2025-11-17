class Naillog < ActiveRecord::Migration[7.2]
  def change
    create_table :naillogs do |t|
      t.string :title, null: false
      t.text :body
      t.date :nailed_date
      t.string :design_url
      t.string :image_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
