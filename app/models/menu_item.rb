class MenuItem < ActiveRecord::Base
	acts_as_nested_set

  belongs_to :page
  belongs_to :menu

  validates_presence_of :title, :menu_id
  validates_presence_of :page_id, :if => lambda{|m| m.redirect.blank? }
  validates_presence_of :redirect, :if => lambda{|m| m.page_id.blank? }

  attr_accessible :title, :redirect, :parent_id, :page_id, :menu_id
  default_scope order(:lft)

  def link
  	if self.redirect.present?
	    return self.redirect
	  else
	  	# TODO: use routes
	  	# url_for(self.page)
	  	return "/#{self.page.slug}"
	  end
  end

  def self.sort_children(element,dbitem)
    prevchild = nil
    element['children'].each do |child|
      childitem = MenuItem.find(child['id'])
      prevchild.nil? ? childitem.move_to_child_of(dbitem) : childitem.move_to_right_of(prevchild)
      sort_children(child, childitem) unless child['children'].nil?
      prevchild = childitem
    end
  end

end
