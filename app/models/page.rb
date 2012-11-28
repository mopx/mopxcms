class Page < ActiveRecord::Base
  attr_accessible :body, :menu, :meta_description, :meta_keywords, :meta_title, :parent_id, :redirect, :slug, :title

  extend FriendlyId
  friendly_id :make_slug, :use => :slugged
 
  def make_slug
    (!self[:slug] || self[:slug].nil? || self[:slug] == "")? title : self[:slug]
  end
end
