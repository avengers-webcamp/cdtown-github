class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

    	t.integer :user_id, :null => false
    	t.datetime :shipping_day, :null => false
    	t.integer :postage, :null => false
    	t.string :post_front, :null => false
    	t.string :post_back, :null => false
    	t.string :prefecture, :null => false
    	t.text :town, :null => false
    	t.integer :post_nambar, :null => false
    	t.string :condo
    	t.integer :payment, :null => false
    	t.text :shipping_status, :null => false
    	t.datetime :deleted_at, :null => false

      t.timestamps
    end
  end
end
