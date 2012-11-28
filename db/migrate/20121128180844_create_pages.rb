class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.integer :parent_id
      t.integer :menu
      t.string :redirect
      t.string :meta_title
      t.string :meta_keywords
      t.text :meta_description

      t.timestamps
    end
  end
end
