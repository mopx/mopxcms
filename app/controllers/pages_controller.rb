class PagesController < ApplicationController

  def show

    # TODO: get index page from settings
    if params[:root_page] && ((!params[:locale].blank? && !I18n.available_locales.include?(params[:locale].to_sym)) or params[:locale].blank?)
      redirect_to homepage_path(I18n.default_locale)
    elsif params[:root_page]
      @page = Page.unscoped.first
    else
      @page = Page.find(params[:id])
    end

    if @page
      @title = @page.title
      @meta_keywords = @page.meta_keywords
      @meta_description = @page.meta_description
    end

  end
end
