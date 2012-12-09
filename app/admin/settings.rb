ActiveAdmin.register Setting do
  actions :index
  menu :priority => 5, :label => proc{ I18n.t("active_admin.settings.title") }
  config.batch_actions = false
  config.clear_sidebar_sections!

  controller do
    def index
      @page_title = I18n.t("active_admin.settings.site_configuration")
      render "admin/settings/_form", :layout => 'active_admin'
    end
  end

  # TODO: catch and display errors
  collection_action :save_settings, :method => :post do
    @errors = []
    for setting in params[:site_settings] do
      @errors << setting[0] if !Setting.set(setting[0], setting[1], nil, true)
    end
    if @errors.size > 0
      redirect_to({:action => :index}, :notice => I18n.t("active_admin.settings.error_saving"))
    else
      redirect_to({:action => :index}, :notice => I18n.t("active_admin.settings.successfully_saved"))
    end
  end

end
