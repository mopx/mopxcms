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

  # move to a better place, and cache all
  def main_menu
    pages = Page.all
    pages.map{ |x| [x.title, page_path(x)] }
  end

end
