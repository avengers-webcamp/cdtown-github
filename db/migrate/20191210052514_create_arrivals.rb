class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.integer :stock_count, :null => false
      t.datetime :arrive_day, :null => false
      t.integer :arrive_count, :null => false

      t.timestamps
      t.datetime :deleted_at
    end

      add_index :arrivals, :deleted_at
  end
end
