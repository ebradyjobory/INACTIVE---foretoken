class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.integer :year
      t.integer :revenue

      t.timestamps
    end
  end
end
