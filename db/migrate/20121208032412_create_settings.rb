class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :key, :null => false
      t.text :value, :null => false
      t.references :user
      t.boolean :system

      t.timestamps
    end
    add_index :settings, :key
    add_index :settings, :user_id
  end
end
