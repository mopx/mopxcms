# encoding: utf-8
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
      :site_name => Setting.get("site_name", nil, true),
      :tagline => Setting.get("tagline", nil, true),
      :meta_keywords => Setting.get("seo_keywords", nil, true),
      :meta_description => Setting.get("seo_description", nil, true)
    })
  end

  def page_title
    if !@title.blank?
      @title + " — " + current_site['site_name']
    else
      current_site['site_name'] + " — " + current_site['tagline']
    end
  end

  def site_link(site)
    link_to current_site['site_title'], "http://#{site.url}"
  end

  def support_link(site)
    mail_to Setting.get("support_email", nil, true)
  end

  def language_selector
    links = []
    I18n.available_locales.each do |locale|
      locale_key = "translation.#{locale}"
      if locale == I18n.locale
        links << link_to(I18n.t(locale_key), "#", class: "btn btn-mini disabled")
      else
        links << link_to(I18n.t(locale_key), url_for(locale: locale.to_s), class: "btn btn-mini")
      end
    end
    links.join("\n").html_safe
  end

end
