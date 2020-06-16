# frozen_string_literal: true

module GroupsHelper
  def show_group_icon(group)
    html_class = 'img-fluid card__image p-2 m-2'
    if group.image.attached?
      render html: image_tag(group.display_image, class: html_class)
    else
      render html: image_tag('no_group_icon.png', class: html_class)
    end
  end
end
