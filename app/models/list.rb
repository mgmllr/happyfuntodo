class List < ActiveRecord::Base
  attr_accessible :name, :user_id

  has_many :items
end
