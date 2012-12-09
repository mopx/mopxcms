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

  def current_site
    HashWithIndifferentAccess.new({
      :site_title => Setting.get("site_name", nil, true),
      :tagline => Setting.get("tagline", nil, true),
      :meta_keywords => Setting.get("seo_keywords", nil, true),
      :meta_description => Setting.get("seo_description", nil, true)
    })
  end

  def page_title
    @title.present? ? @title + " | " + current_site['site_title'] : current_site['site_title'] + " | " + current_site['tagline']
  end

  def site_link(site)
    link_to current_site['site_title'], "http://#{site.url}"
  end

  def support_link(site)
    mail_to Setting.get("support_email", nil, true)
  end

end
