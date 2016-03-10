class AddWikisToCollaborators < ActiveRecord::Migration
  def change
    add_column :collaborators, :wiki_id, :integer
    add_index :collaborators, :wiki_id
  end
end
