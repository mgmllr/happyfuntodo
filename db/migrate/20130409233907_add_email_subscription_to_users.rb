class AddEmailSubscriptionToUsers < ActiveRecord::Migration
  def up
    add_column :users, :email_subscription, :boolean
  end

  def down
		remove_column :users, :email_subscription
  end
end
