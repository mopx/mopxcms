ActiveAdmin.register Page do
  menu :priority => 1, :parent => 'CMS'

  index do
    id_column
    column :title
    column(I18n.t("active_admin.pages.url")) {|page| link_to "#{page.permalink}", "#{page.permalink}" }
    column(I18n.t("active_admin.pages.path")) {|page| page.path }
    default_actions
  end

  show do |ad|
    rows = default_attribute_table_rows.reject {|a| a =~ /title|body/}
    attributes_table *rows

    I18n.available_locales.each do |locale|
      h4 I18n.t(locale, scope: ["translation"])
      attributes_table do
        translation = ad.translations.where(locale: locale).first
        if translation
          row(:title) do
            translation.title
          end
          row(:body) do
            textilize(translation.body).html_safe
          end
          row(:meta_keywords) do
            translation.meta_keywords
          end
          row(:meta_description) do
            translation.meta_description
          end
        else
          div do
            para "translation missing"
          end
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.globalize_inputs :translations do |lf|
        lf.inputs do
          lf.input :title
          lf.input :body, 
            :hint => I18n.t("active_admin.pages.formatted_with_textile", :reference_link => link_to(I18n.t("active_admin.pages.reference_guide"), "http://redcloth.org/hobix.com/textile/", :target => "_blank") ).html_safe,
            :as => :text,
            :input_html => { :rows => 20, :cols => 5, :class => "autogrow" }
          lf.input :meta_keywords,
            :hint => I18n.t("active_admin.pages.seo_keywords")
          lf.input :meta_description,
            :as => :text,
            :hint => I18n.t("active_admin.pages.seo_description"),
            :input_html => { :rows => 4, :cols => 5, :class => "autogrow" }
          lf.input :locale, :as => :hidden
        end
      end
      f.input :slug
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

  action_item :only => [:show, :edit] do
    link_to I18n.t("active_admin.pages.view_public"), page.path
  end

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
