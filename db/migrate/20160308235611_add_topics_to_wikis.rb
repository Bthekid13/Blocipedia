class AddTopicsToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :topic_id, :integer
    add_index :wikis, :topic_id
  end
end
