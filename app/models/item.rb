class Item < ActiveRecord::Base
  attr_accessible :completed, :list_id, :task

  belongs_to :list

end