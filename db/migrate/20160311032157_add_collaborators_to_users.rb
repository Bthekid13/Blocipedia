class AddCollaboratorsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :collaboration_id, :integer
    add_index :users, :collaboration_id
  end
end
