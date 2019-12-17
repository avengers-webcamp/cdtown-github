class AddDiscIdToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :disc_id, :integer
  end
end
