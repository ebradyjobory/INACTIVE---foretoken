class AlterForecastData < ActiveRecord::Migration
  def up
  	add_column :forecasts, :data_id, :integer
  	add_index :forecasts, :data_id
  end

  def down
  	remove_index :forecasts, :data_id
  	remove_column :forecasts, :data_id
  	
  end
end
