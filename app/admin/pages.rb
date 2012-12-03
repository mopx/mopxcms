ActiveAdmin.register Page do
  menu :priority => 1, :parent => 'CMS'

  index do
    id_column
    column :title
    column(I18n.t("active_admin.pages.url")) {|page| link_to "#{page.permalink}", "#{page.permalink}" }
    default_actions
  end

  show do |ad|
    rows = default_attribute_table_rows.reject {|a| a =~ /body/}
    attributes_table *rows do
      row(:body) {|u|
        textilize(u.body).html_safe
      }
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :body, 
        :hint => I18n.t("active_admin.pages.formatted_with_textile", :reference_link => link_to(I18n.t("active_admin.pages.reference_guide"), "http://redcloth.org/hobix.com/textile/", :target => "_blank") ).html_safe,
        :input_html => { :rows => 20, :cols => 20}
      f.input :meta_keywords,
        :hint => I18n.t("active_admin.pages.seo_keywords"),
        :input_html => { :rows => 4, :cols => 20}
      f.input :meta_description,
        :hint => I18n.t("active_admin.pages.seo_description"),
        :input_html => { :rows => 4, :cols => 20}
    end
    f.buttons
  end
  
  controller do
    def show
      @page = Page.find(params[:id])
      @versions = @page.versions
      @page = @page.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
    end
  end

  sidebar I18n.t("active_admin.versions.title"), :partial => "admin/versions", :only => [:edit, :show]

  member_action :restore, :method => :post do
    version = Version.find(params[:version_id])
    if version.reify
      version.reify.save!
      redirect_to :back, :notice => I18n.t("active_admin.restored")
    else
      version.item.destroy
      redirect_to({:action => :index}, :notice => I18n.t("active_admin.destroyed"))
    end
  end

end
