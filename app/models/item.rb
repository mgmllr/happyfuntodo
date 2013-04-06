class Item < ActiveRecord::Base
  attr_accessible :completed, :list_id, :task

  belongs_to :list
  validates_presence_of :task
  validates_uniqueness_of :task

end