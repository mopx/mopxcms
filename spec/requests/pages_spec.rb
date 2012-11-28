# encoding: utf-8
require 'spec_helper'

describe "Pages" do
  describe "GET show/:id" do
    it "displays page content" do
      new_page = FactoryGirl.create(:page, :title => "hola", :body => "wooo este es el contenido")
      visit page_path(new_page.id)
      page.should have_content(new_page.title)
      page.should have_content(new_page.body)
      page.should have_xpath("//head/title", :text => /#{new_page.title}/)
    end
    it "displays meta tags" do
      new_page = FactoryGirl.create(:page, :meta_keywords => "test test 2", :meta_description => "está es la descripción")
      visit page_path(new_page.id)
      page.should have_xpath("//head/meta[@name='keywords']", :content => new_page.meta_keywords)
      page.should have_xpath("//head/meta[@name='description']", :content => new_page.meta_description)
    end
  end
end
