class CreateCdOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :cd_orders do |t|
      t.integer :order_id, :null => false
      t.integer :cd_id, :null => false
      t.integer :total_price, :null => false
      t.integer :count, :null => false
      t.integer :price, :null => false
      t.integer :tax, :null => false
      t.integer :disc_count, :null => false

      t.timestamps
      t.datetime :deleted_at
    end

      add_index :cd_orders, :deleted_at
  end
end
