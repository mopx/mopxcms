class MenuItem < ActiveRecord::Base
	acts_as_nested_set

  belongs_to :page
  belongs_to :menu
  attr_accessible :title, :redirect, :parent_id

  def link
  	if self.redirect.present?
	    return self.redirect
	  else
	  	# TODO: use routes
	  	# url_for(self.page)
	  	return "/#{self.page.slug}"
	  end
  end
end
