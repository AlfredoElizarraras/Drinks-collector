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

  def group_delete_icon(user_id, group)
    if current_user.id == user_id
      render html:  link_to("X", group_path(group), method: :delete, 
      data: { confirm: "Are you sure to erase #{group.name} group?" },
      class: 'position-absolute postion-top position-right px-1 erase-button')
    end
  end
end
