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

  def provider_name(provider)
    if provider == 'google_oauth2'
      'google'
    else
      provider
    end
  end

  def provider_order(provider)
    if provider == 'facebook'
      1
    elsif provider == 'google_oauth2'
      2
    elsif provider == 'github'
      3
    end
  end
end
