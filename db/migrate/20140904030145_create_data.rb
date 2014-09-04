class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end
