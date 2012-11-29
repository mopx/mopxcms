class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name, :null => false
      t.string :display_name, :null => false
      t.text :description

      t.timestamps
    end
  end
end
