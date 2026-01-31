class AddStatusIntToNaillogs < ActiveRecord::Migration[7.2]
  def up
    # 文字列 status があれば削除
    if column_exists?(:naillogs, :status, :string)
      remove_column :naillogs, :status
    end

    # integer status がなければ追加
    unless column_exists?(:naillogs, :status, :integer)
      add_column :naillogs, :status, :integer, default: 0, null: false
    end
  end

  def down
    # rollback 可能にしておく（最低限）
    if column_exists?(:naillogs, :status, :integer)
      remove_column :naillogs, :status
    end

    unless column_exists?(:naillogs, :status, :string)
      add_column :naillogs, :status, :string
    end
  end
end