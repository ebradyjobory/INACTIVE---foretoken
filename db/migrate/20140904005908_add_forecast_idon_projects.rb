class AddForecastIdonProjects < ActiveRecord::Migration

  def up
  	add_column :projects, :forecast_id, :integer
  end

  def down
  	remove_column :projects, :forecast_id
  end
end
