class ApplicationController < ActionController::Base
  protect_from_forgery

  # Override template methods in ActiveAdmin::Views::Pages
  require 'active_admin_views_pages_base.rb'

  # TODO: user preferences, let the user select the locale
  before_filter :set_locale
  def set_locale
    # I18n.locale = params[:locale]
    # harcoded to english
    I18n.locale = "en"
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protected

  def user_for_paper_trail
    admin_user_signed_in? ? current_admin_user : 'Unknown user'
  end

end
