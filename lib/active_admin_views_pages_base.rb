class ActiveAdmin::Views::Pages::Base < Arbre::HTML::Document

  private


  def build_page
    within @body do
      div :id => "wrapper" do
        build_header
        build_title_bar
        build_page_content
      end
      build_footer
    end
  end

  # Renders the content for the footer
  def build_footer
    div :id => "footer" do
      div :class => "credits" do
      	"Powered by #{link_to('mopxcms', 'https://github.com/mopx/mopxcms')} and bunch of evil daemons and widgetry.".html_safe
      end
      div :class => "developed" do
      	link_to I18n.t("active_admin.footer.developed_by"), "http://app.com.pa"
      end
    end
  end

end
