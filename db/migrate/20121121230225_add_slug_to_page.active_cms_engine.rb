# This migration comes from active_cms_engine (originally 20120320171554)
class AddSlugToPage < ActiveRecord::Migration
  def change
    add_column :active_cms_pages, :slug, :string, :unique => true
  end
end
