class AddUsersToCollaborators < ActiveRecord::Migration
  def change
    add_column :collaborators, :user_id, :integer
    add_index :collaborators, :user_id
  end
end
