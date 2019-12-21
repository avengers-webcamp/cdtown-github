class CreateDeliverAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_addresses do |t|
    	t.integer :user_id, :null => false
      t.string :deliver_last_name, :null => false
      t.string :deliver_first_name, :null => false
    	t.string :deliver_post_front, :null => false
    	t.string :deliver_post_back, :null => false
    	t.string :deliver_prefecture, :null => false
    	t.text :deliver_town, :null => false
    	t.integer :deliver_post_number, :null => false
    	t.string :deliver_condo


      t.timestamps
    end
  end
end
