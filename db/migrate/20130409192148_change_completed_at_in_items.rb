class ChangeCompletedAtInItems < ActiveRecord::Migration
  def up
  	remove_column :items, :completed_at
  	add_column :items, :completed_at, :datetime
  end

  def down
  end
end
