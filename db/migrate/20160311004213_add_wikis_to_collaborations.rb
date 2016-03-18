class AddWikisToCollaborations < ActiveRecord::Migration
  def change
    add_column :collaborations, :wiki_id, :integer
    add_index :collaborations, :wiki_id
  end
end
