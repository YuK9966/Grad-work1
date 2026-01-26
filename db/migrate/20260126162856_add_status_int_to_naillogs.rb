class AddStatusIntToNaillogs < ActiveRecord::Migration[7.2]
  def change
    add_column :naillogs, :status, :integer, default: 0, null: false
  end
end
