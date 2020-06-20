# frozen_string_literal: true

module DrinksHelper
  def drinks_total(total)
    if total >= 1000
      "#{total / 1000}L"
    else
      "#{total}ml"
    end
  end

  def show_icon(drink)
    html_class = 'img-fluid card__image p-2 m-2'
    if drink.group.nil?
      render html: image_tag('no_group.png', class: html_class)
    elsif drink.group.image.attached?
      render html: image_tag(drink.group.display_image, class: html_class)
    else
      render html: image_tag('no_group_icon', class: html_class)
    end
  end

  def format_date(date)
    date.strftime('%d %B %Y')
  end

  def drink_delete_icon(user_id, drink)
    if current_user.id == user_id
      render html: link_to("X", drink_path(drink), method: :delete,
      data: { confirm: "Are you sure to erase #{drink.name} drink?" },
      class: 'position-absolute postion-top position-right px-1 erase-button')
    end
  end

  def drink_page(page)
    cookies[:drinks_page] = page
  end

  def select_group(f)
    if !cookies[:drinks_page].nil? && cookies[:drinks_page] == 'All my drinks'
      render html: f.collection_select(:group_id, @groups || [], :id, :name, 
      { include_blank: 'Add to group:' },{ class: 'full-width' })
    end
  end
end
