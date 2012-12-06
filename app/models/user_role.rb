class UserRole < ActiveRecord::Base
  belongs_to :user
  attr_accessible :role
  validates_presence_of :role, :user_id
  validates_uniqueness_of :role, :scope => :user_id
end
