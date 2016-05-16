class AddUsersToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :users_id, :integer
    add_index :wikis, :users_id
  end
end
