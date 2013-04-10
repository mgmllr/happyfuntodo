class AddCompletedAtToItems < ActiveRecord::Migration
  def change
    add_column :items, :completed_at, :date
    remove_column :users, :completed_at
  end
end
