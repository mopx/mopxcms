class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    unless @page
      not_found
    else
      @title = @page.title
      @meta_keywords = @page.meta_keywords || 'meta'
      @meta_description = @page.meta_description || 'meta'
    end

  end
end
