class Menu < ActiveRecord::Base
  attr_accessible :description, :display_name, :name
  has_many :menu_items
end
