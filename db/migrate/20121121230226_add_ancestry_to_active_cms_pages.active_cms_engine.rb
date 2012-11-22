# This migration comes from active_cms_engine (originally 20120320194701)
class AddAncestryToActiveCmsPages < ActiveRecord::Migration
  def change
    add_column :active_cms_pages, :ancestry, :string
    add_index :active_cms_pages, :ancestry
  end
end
