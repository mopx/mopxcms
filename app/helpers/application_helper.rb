module ApplicationHelper

  def flash_messages
    $flash_keys ||= [:error, :success, :notice, :warning, :alert]
    return unless messages = flash.keys.select{|k| $flash_keys.include?(k)}

    formatted_messages = messages.map do |type|
      content_tag :div, :class => "alert alert-#{type.to_s}" do
        message_for_item(flash[type], flash["#{type}_item".to_sym])
      end
    end
    flash.clear # strictly clear the flash messages
    raw(formatted_messages.join)
  end

  def message_for_item(message, item = nil)
    if item.is_a?(Array)
      message % link_to(*item)
    else
      message % item
    end
    message = "#{message} <a class='close' data-dismiss='alert' href='#'>&times;</a>".html_safe
  end
  
  def body_tag_classes
    "#{controller.controller_name}_#{controller.action_name}"
  end

  # TODO: put this configuration on the database
  def current_site
    HashWithIndifferentAccess.new({
      :site_title => "mopxcms",
      :meta_keywords => "hola",
      :meta_description => "adios"
    })
  end

  def site_title
    @title.present? ? @title + " | " + current_site['site_title'] : current_site['site_title']
  end

  def site_link(site)
    link_to site.name, "http://#{site.url}"
  end

  def support_link(site)
    mail_to site.support_email
  end

  # TODO: move to a better place, and cache all
  def get_menu(menu_name = '', class_names = '')
    menu = Menu.find_by_name(menu_name)
    if menu
      menu_items = menu.menu_items.where(:parent_id => nil)
      content_tag(:ul, :id => menu_name, :class => class_names) do
        html = ""
        menu_items.collect do |item|
          dropdown = true if item.children.size > 0
          html2 = ""
          classes = "menu-item menu-item-#{item.id}"
          classes << " dropdown" if dropdown
          html2 << content_tag(:li, :class => classes) do
            if dropdown
              get_dropdown(item)
            else
              nav_link(item)
            end
          end
          html << html2
        end
        html.html_safe
      end
    else
      # TODO: do something
      # the menu doesn't exists"
    end
  end

  def get_dropdown(parent, second_level = false)
    ul_class = "dropdown-menu"
    html = ""
    html << nav_link(parent, true, second_level)
    html << content_tag(:ul, :class => ul_class) do
      html2 = ""
      html2 << content_tag(:li, :class => "menu-item menu-item-#{parent.id}") do
        nav_link(parent, false, second_level)
      end
      parent.children.collect do |item|
        dropdown = true if item.children.size > 0
        classes = dropdown ? "menu-item menu-item-#{item.id} dropdown-submenu" : "menu-item menu-item-#{item.id}"
        html2 << content_tag(:li, :class => classes) do
          if dropdown
            get_dropdown(item, true)
          else
            nav_link(item, false, second_level)
          end
        end
      end
      html2.html_safe
    end
    html.html_safe
  end

  def nav_link(item, dropdown = false, second_level = false)
    link = dropdown ? "#" : item.link
    link_to(link, :class => (dropdown ? "dropdown-toggle" : nil), "data-toggle" => (dropdown ? "dropdown" : nil), "data-target" => (dropdown ? link : nil) ) do
      html = ""
      html << item.title
      html << content_tag(:b, "", :class => "caret") if dropdown && !second_level
      html.html_safe
    end
  end

end
