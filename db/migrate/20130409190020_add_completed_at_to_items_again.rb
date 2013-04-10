class AddCompletedAtToItemsAgain < ActiveRecord::Migration
  def change
    remove_column :items, :completed_at
    add_column :items, :completed_at, :time
    remove_column :items, :created_at
    add_column :items, :created_at, :timestamp
  end
end
