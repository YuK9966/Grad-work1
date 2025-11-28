class AddStatusToNaillogs < ActiveRecord::Migration[7.2]
  def change
    add_column :naillogs, :status, :string, default: "下書き", null: false
    add_column :naillogs, :nail_shape, :string
  end
end
