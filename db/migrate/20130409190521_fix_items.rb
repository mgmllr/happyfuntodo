class FixItems < ActiveRecord::Migration
  def up
  	drop_table :items 

  	create_table :items do |t|
  		t.string :task
  		t.boolean :completed
  		t.integer :list_id
  		t.time :completed_at

  		t.timestamps
  	end
  end

  def down
  	drop_table :items
  end
end
