# frozen_string_literal: true

module ApplicationHelper
  def page_name(name)
    render html: content_for(:title, name)
  end

  def html_class_main_div(page)
    if current_user.nil?
     'mt-8'  
    elsif !current_user.nil? && page != current_user.name
      'mt-8'  
    end
  end
end
