class AddLikesCountToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :likes_count, :integer
  end
end
