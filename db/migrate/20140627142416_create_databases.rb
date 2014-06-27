class CreateDatabases < ActiveRecord::Migration
  def change
    create_table :databases do |t|
      t.integer :type
      t.string :db_name

      t.timestamps
    end
  end
end
