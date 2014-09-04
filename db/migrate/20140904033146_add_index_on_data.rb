class AddIndexOnData < ActiveRecord::Migration
  def up
  	add_index :data, :project_id
  end

  def down
  	remove_index :data, :project_id	
  end
end
