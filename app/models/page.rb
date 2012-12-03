class Page < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  has_paper_trail

  has_many :menu_items
  attr_accessible :title, :slug, :body, :meta_keywords, :meta_description

  extend FriendlyId
  friendly_id :make_slug, :use => :slugged
 
  def make_slug
    (!self[:slug] || self[:slug].nil? || self[:slug] == "")? title : self[:slug]
  end

  # TODO: make this better.
  def permalink
    "/#{self.slug}"
  end

  def admin_permalink
    admin_page_path(self)
  end

  def get_version(version)
    v = nil
    version = self.versions.each_with_index.map do |x,i|
      # puts [x.id, i].inspect
      if version.to_i == x.id
        v = i+1
        break
      end
    end
    return v
  end

end
