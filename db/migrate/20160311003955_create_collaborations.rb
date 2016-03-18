class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|

      t.timestamps null: false
    end
  end
end
