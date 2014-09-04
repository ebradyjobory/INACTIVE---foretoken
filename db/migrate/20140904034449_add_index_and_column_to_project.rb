class AddIndexAndColumnToProject < ActiveRecord::Migration
  def up
  	add_column :projects, :data_id, :integer
  	add_index :projects, :data_id

  end

  def down
  	remove_index :projects, :data_id
  	remove_column :projects, :data_id, :integer
  end
end
