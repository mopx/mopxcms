# encoding: utf-8
require 'spec_helper'

describe "Menus" do
  describe "get menu" do
    it "display default menu" do
      I18n.locale = :es
      new_page = FactoryGirl.create(:page)
      menu = FactoryGirl.create(:menu, :display_name => "Main Menu")
      menu_item = FactoryGirl.create(:menu_item_page, :page => new_page, :menu => menu, :title => "home")
      visit page_path(new_page, :locale => I18n.locale)
			find('#main_menu').should have_link(menu_item.title)
    end
    it "display menu with child items" do
      I18n.locale = :es
      new_page = FactoryGirl.create(:page)
      menu = FactoryGirl.create(:menu, :display_name => "Main Menu")
      menu_item = FactoryGirl.create(:menu_item_page, :page => new_page, :menu => menu, :title => "home")
      menu_item2 = FactoryGirl.create(:menu_item_page, :page => new_page, :menu => menu, :parent => menu_item, :title => "sub item")
      visit page_path(new_page, :locale => I18n.locale)
			find("#main_menu .menu-item-#{menu_item.id} .dropdown-menu").should have_link(menu_item2.title)
	  end
  end
end
