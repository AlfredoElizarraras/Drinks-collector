# frozen_string_literal: true

module GroupsHelper
  def show_group_icon(group)
    unless group.icon == ''
      render html: image_tag(group.icon)
    else
      render html: image_tag('no_group.png')
    end
  end
end
