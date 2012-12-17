class Page < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

  # versioning
  # not needed when using translates :versioning => true
  # has_paper_trail

  has_many :menu_items, :dependent => :destroy
  attr_accessible :title, :slug, :body, :meta_keywords, :meta_description, :locale, :translations_attributes

  extend FriendlyId
  friendly_id :make_slug, :use => :slugged

  # globalize3, separate table for translations
  translates :title, :body, :meta_keywords, :meta_description, :versioning => true

  accepts_nested_attributes_for :translations

  class Translation
    attr_accessible :locale, :title, :body, :meta_keywords, :meta_description
  end
 
  def make_slug
    (!self[:slug] || self[:slug].nil? || self[:slug] == "")? title : self[:slug]
  end

  # TODO: make this better.
  def permalink
    page_url(self, :locale => I18n.locale)
  end

  def path
    "/#{self.slug}"
  end

  def admin_link
    admin_page_path(self, :locale => I18n.locale)
  end

  def get_version(version)
    v = nil
    version = self.versions.each_with_index.map do |x,i|
      if version.to_i == x.id
        v = i+1
        break
      end
    end
    return v
  end

  def translations_attributes=(attributes)
    new_translations = attributes.values.reduce({}) do |new_values, translation|
      new_values.merge! translation.delete("locale") => translation
    end
    set_translations new_translations
  end

end
