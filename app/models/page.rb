class Page < ActiveRecord::Base
	has_many :menu_items
  attr_accessible :title, :slug, :body, :meta_keywords, :meta_description

  extend FriendlyId
  friendly_id :make_slug, :use => :slugged
 
  def make_slug
    (!self[:slug] || self[:slug].nil? || self[:slug] == "")? title : self[:slug]
  end
end
