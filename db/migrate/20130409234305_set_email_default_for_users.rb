class SetEmailDefaultForUsers < ActiveRecord::Migration
  def up
  	change_column :users, :email_subscription, :boolean, default: true
  end

  def down
  	raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end