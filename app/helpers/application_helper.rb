# frozen_string_literal: true

module ApplicationHelper
  def page_name(name)
    render html: content_for(:title, name)
  end
end
