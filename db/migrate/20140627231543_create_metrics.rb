class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.integer :chart_id
      t.datetime :time
      t.decimal :value

      t.timestamps
    end
  end
end
