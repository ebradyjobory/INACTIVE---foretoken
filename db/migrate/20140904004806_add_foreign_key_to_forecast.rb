class AddForeignKeyToForecast < ActiveRecord::Migration

  def up
  	add_column :forecasts, :project_id, :integer
  end

  def down
  	remove_column :forecasts, :project_id
  end
end
