class MigrateStatusStrToStatusInt < ActiveRecord::Migration[7.2]
  def up
    execute <<~SQL
      UPDATE naillogs
      SET status = CASE status_str
        WHEN '下書き' THEN 0
        WHEN '下書き保存' THEN 0
        WHEN '公開' THEN 1
        ELSE 0
      END
    SQL
  end

  def down
    execute <<~SQL
      UPDATE naillogs
      SET status_str = CASE status
        WHEN 0 THEN 'draft'
        WHEN 1 THEN 'published'
      else 'draft'
      END
    SQL
  end
end
