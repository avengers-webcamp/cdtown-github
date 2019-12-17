class RemoveUserIdFromCds < ActiveRecord::Migration[5.2]
  def change
    remove_column :cds, :user_id, :integer
  end
end
