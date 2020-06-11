# frozen_string_literal: true

module GroupsHelper
  def show_group_icon(group)
    if !group.nil?
      render html: image_tag(group.icon) unless group.icon.nil?
    else
      render html: image_tag('no_group.png')
    end
  end
end
