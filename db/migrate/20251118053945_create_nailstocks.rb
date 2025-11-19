class CreateNailstocks < ActiveRecord::Migration[7.2]
  def change
    create_table :nailstocks do |t|
      t.references :nail_item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
