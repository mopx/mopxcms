class Menu < ActiveRecord::Base
  attr_accessible :description, :display_name, :name
  has_many :menu_items, :dependent => :destroy
  validates_presence_of :name, :display_name
  validates_uniqueness_of :name, :display_name

  before_validation :set_name

  private

  def set_name
  	self.name = self.display_name.parameterize('_')
  end
end
