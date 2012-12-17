class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.string :slug

      t.timestamps
    end
    Page.create_translation_table! :title => :string,
      :body => :text,
      :meta_keywords => :string,
      :meta_description => :text
  end

  def down
    drop_table :pages
    Page.drop_translation_table!
  end
end
