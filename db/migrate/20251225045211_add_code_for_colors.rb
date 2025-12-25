class AddCodeForColors < ActiveRecord::Migration[7.2]
  def change
    add_column :colors, :color_code, :string, null: false
  end
end
