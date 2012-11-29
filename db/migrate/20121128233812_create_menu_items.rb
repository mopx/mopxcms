class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :title
      t.references :page
      t.string :redirect
      t.references :menu, :null => false
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      t.timestamps
    end
    add_index :menu_items, :page_id
    add_index :menu_items, :menu_id
    add_index :menu_items, :parent_id
  end
end
