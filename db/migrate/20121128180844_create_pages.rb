class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.string :meta_keywords
      t.text :meta_description

      t.timestamps
    end
  end
end
