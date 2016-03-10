class AddTopicsToCollaborators < ActiveRecord::Migration
  def change
    add_column :collaborators, :topic_id, :integer
    add_index :collaborators, :topic_id
  end
end
