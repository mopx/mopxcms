class ApplicationController < ActionController::Base
  protect_from_forgery

  # Override build_footer method in ActiveAdmin::Views::Pages
  require 'active_admin_views_pages_base.rb'

  before_filter :set_locale
  def set_locale
    # I18n.locale = params[:locale]
    I18n.locale = "en"
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end
