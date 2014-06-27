class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :name
      t.integer :db_id
      t.string :query
      t.integer :type

      t.timestamps
    end
  end
end
