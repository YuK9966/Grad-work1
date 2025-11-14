class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[7.2]
  def change
    # 既存のインデックスがあれば削除
    remove_index :users, :email if index_exists?(:users, :email)
    
    # ユニークインデックスを追加
    add_index :users, :email, unique: true
  end
end
