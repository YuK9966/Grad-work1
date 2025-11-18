class CreateLogColors < ActiveRecord::Migration[7.2]
  def change
    create_table :log_colors do |t|
      t.timestamps
    end
  end
end
