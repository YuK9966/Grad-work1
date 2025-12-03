class AddMainImageFornaillogs < ActiveRecord::Migration[7.2]
  def change
    add_column :naillogs, :main_image, :string
  end
  add_index :naillogs, :main_image, unique: true
end
