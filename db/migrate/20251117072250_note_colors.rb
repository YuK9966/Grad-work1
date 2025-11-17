class NoteColors < ActiveRecord::Migration[7.2]
  def change
    create_table :log_colors do |t|
      t.references :color, null: false, foreign_key: true
      t.references :naillog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
