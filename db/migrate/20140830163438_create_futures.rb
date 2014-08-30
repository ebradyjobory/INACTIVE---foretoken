class CreateFutures < ActiveRecord::Migration
  def change
    create_table :futures do |t|
      t.integer :future_year

      t.timestamps
    end
  end
end
