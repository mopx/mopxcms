module MenusHelper
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
      html2 << content_tag(:li, "", :class => "divider")
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
