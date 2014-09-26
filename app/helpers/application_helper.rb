module ApplicationHelper

  def formatted_date(date)
    date.strftime("%Y-%b-%d")
  end
  
  def flash_messages
    flashes = ""
    flash.each do |type, value|
      flashes += content_tag(:div, value, class: flash_class(type.to_sym))
    end
    content_tag(:div, flashes.html_safe)
  end

  def flash_class(type)
    case type
    when :notice then "alert altert-info"
    when :success then "alert alert-success"
    when :alert then "alert alert-danger"
    end
  end

end
