class Item < ActiveRecord::Base
  attr_accessible :completed, :list_id, :task, :completed_at

  belongs_to :list
  validates_presence_of :task

  scope :recently_completed, lambda { where("completed_at > ?", Time.now - 1.day ) }
  scope :uncompleted, where(completed: false)
end