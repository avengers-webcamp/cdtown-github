class AddLastNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :post_front, :string
    add_column :users, :post_back, :string
    add_column :users, :prefecture, :string
    add_column :users, :town, :text
    add_column :users, :post_number, :integer
    add_column :users, :condo, :string
    add_column :users, :phone_number, :string
  end
end
