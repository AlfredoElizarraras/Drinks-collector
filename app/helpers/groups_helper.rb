# frozen_string_literal: true

module GroupsHelper
  def show_group_icon(group)
    html_class = 'img-fluid card__image p-2 m-2'
    if group.icon == ''
      render html: image_tag('no_group.png', class: html_class)
    else
      p html_class
      render html: image_tag(group.icon, class: html_class)
    end
  end
end
