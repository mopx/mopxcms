ActiveAdmin.register Menu do
  menu :priority => 2, :parent => 'CMS'

  index do
    id_column
    column :name
    column :display_name
    column(I18n.t("active_admin.menus.items")) {|menu| menu.menu_items.count }
    default_actions
  end

  show do |ad|
    rows = default_attribute_table_rows.reject {|a| a =~ /id|created_at|updated_at|display_name/}
    attributes_table *rows do
      row(:menu_items) {|m| ( render :partial => "admin/menus/menu_items", :locals => { :menu => m, :menu_items => m.menu_items } ) }
    end
  end

  form do |f|
    f.inputs do
      f.input :display_name
      f.input :description
    end
    f.actions
  end

  member_action :savesort, :method => :post do
    begin
    	menu = Menu.find(params[:id])
      neworder = JSON.parse(params[:set])
      prev_item = nil
      neworder.each do |item|
        dbitem = menu.menu_items.find(item['id'])
        prev_item.blank? ? dbitem.move_to_root : dbitem.move_to_right_of(prev_item)
        menu.menu_items.sort_children(item, dbitem) unless item['children'].blank?
        prev_item = dbitem
      end
      MenuItem.rebuild!
      render :inline => { :status => true, :message => I18n.t("active_admin.menus.successfully_saved") }.to_json, :layout => false
    rescue Exception => e
      render :inline => { :status => false, :message => I18n.t("active_admin.menus.error_saving") }.to_json, :layout => false
    end
  end

end
