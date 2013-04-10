class AddCreatedAtToItems < ActiveRecord::Migration
  def change
    remove_column :items, :created_at
    add_column :items, :created_at, :time
  end
end
