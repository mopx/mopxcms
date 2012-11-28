require 'spec_helper'

describe "Pages" do
  describe "GET show/:id" do
    it "display page content" do
      new_page = Page.create!(:title => "hola", :body => "wooo este es el contenido")
      visit page_path(new_page.id)
      page.should have_content("hola")
      page.should have_content("wooo este es el contenido")
    end
  end
end
