class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

    	t.integer :user_id, :null => false
    	t.date :shipping_day, :null => false
    	t.integer :postage, :null => false
      t.string :last_name
      t.string :first_name
    	t.string :post_front, :null => false
    	t.string :post_back, :null => false
    	t.string :prefecture, :null => false
    	t.text :town, :null => false
    	t.integer :post_number, :null => false
    	t.string :condo
    	t.text :payment, :null => false
    	t.text :shipping_status, :null => false
    	t.datetime :deleted_at

      t.timestamps
    end

      add_index :orders, :deleted_at
  end
end
