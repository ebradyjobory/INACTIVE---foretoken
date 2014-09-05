class AltureFuturesTable < ActiveRecord::Migration

  def up
  	add_column :futures, :project_id, :integer
  	add_index :futures, :project_id
  end

  def down
  	remove_index :futures, :project_id
  	remove_column :futures, :project_id, :integer
  end
end
