class AlterForecastTable < ActiveRecord::Migration

  def up
  	add_column :forecasts, :project_id, :integer
  	add_index :forecasts, :project_id
  end

  def down
  	remove_index :forecasts, :project_id
  	remove_column :forecasts, :project_id, :integer
  	
  end
end
