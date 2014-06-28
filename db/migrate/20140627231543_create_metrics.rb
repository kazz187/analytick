class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics, id: false do |t|
      t.integer :chart_id
      t.datetime :time
      t.decimal :value

      t.timestamps
    end
    add_index :metrics, [:chart_id, :time], unique: true
  end
end
