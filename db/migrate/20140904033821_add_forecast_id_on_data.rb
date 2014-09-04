class AddForecastIdOnData < ActiveRecord::Migration
  def up
  	add_column :data, :forecast_id, :integer
  end

  def down
  	remove_column :data, :forecast_id
  end
end
