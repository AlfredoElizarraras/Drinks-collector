# frozen_string_literal: true

module GroupsHelper
  def show_group_icon(group)
    if group.icon == ''
      render html: image_tag('no_group.png')
    else
      render html: image_tag(group.icon)
    end
  end
end
