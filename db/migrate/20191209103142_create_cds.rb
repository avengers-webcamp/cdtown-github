class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
     t.string :name, :null => false
     t.integer :artist_id, :null => false
     t.integer :genre_id, :null => false
     t.integer :label_id, :null => false
     t.string :jacket_image_id
     t.date :released_at, :null => false
     t.string :price, :null => false
     t.integer :stock
     t.integer :status, :null => false, limit: 1
     t.datetime :deleted_at
      t.timestamps
    end
     add_index :cds, :deleted_at
  end
end
