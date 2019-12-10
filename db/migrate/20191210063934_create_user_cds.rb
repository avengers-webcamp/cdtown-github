class CreateUserCds < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cds do |t|
      t.integer :user_id, :null => false
      t.integer :cd_id, :null => false
      t.string :disc_count, :null => false

      t.timestamps
    end
  end
end
