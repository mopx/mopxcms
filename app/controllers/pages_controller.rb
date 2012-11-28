class PagesController < ApplicationController

  def show
    if params[:root_page]
      # TODO: get index page from settings
      @page = Page.unscoped.first
    else
      @page = Page.find(params[:id])
    end
    @title = @page.title
    @meta_keywords = @page.meta_keywords
    @meta_description = @page.meta_description
  end
end
