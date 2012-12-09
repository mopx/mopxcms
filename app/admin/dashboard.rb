ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel I18n.t("active_admin.new_users") do
          table_for User.limit(5).map do
            column do |u| link_to(u.display_name, admin_user_path(u)) end
          end
        end
      end
      column do
        panel I18n.t("active_admin.pages.title") do
          table_for Page.limit(5).map do
            column do |p| link_to(p.title, admin_page_path(p))
            end
          end
        end
      end
    end

    columns do
      column do
        panel I18n.t("active_admin.recently_updated_content") do
          table_for Version.order('id desc').limit(10) do
            column I18n.t("active_admin.item") do |v| link_to v.item.title, v.item.admin_permalink end
            column I18n.t("active_admin.type") do |v| v.item_type.underscore.humanize end
            column I18n.t("active_admin.modified_at") do |v| v.created_at.to_s :long end
            column I18n.t("active_admin.responsible") do |v| link_to User.find(v.whodunnit).email, admin_user_path(User.find(v.whodunnit)) end
          end
        end
      end
    end

  end
end
