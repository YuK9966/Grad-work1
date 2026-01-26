class AddStatusStringToNaillogs < ActiveRecord::Migration[7.2]
  def change
    add_column :naillogs, :status_str, :string, default: "下書き", null: false
  end
end
