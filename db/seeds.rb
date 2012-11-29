# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
page = Page.create!(:title => "Home", :body => "Hello World!")
menu = Menu.create!(:name => "main_menu", :display_name => "Main Menu")
menu_item = MenuItem.create!(:title => page.title, :page_id => page.id, :menu_id => menu.id)
