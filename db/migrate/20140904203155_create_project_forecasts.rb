class CreateProjectForecasts < ActiveRecord::Migration
  def up
    create_table :project_forecasts do |t|
    	t.references :forecast
    	t.references :project
      	t.timestamps
    end
    add_index :project_forecasts, ["project_id", "forecast_id"]
  end
end
