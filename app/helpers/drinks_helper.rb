# frozen_string_literal: true

module DrinksHelper
  def drinks_total(total)
    if total > 1000
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
end
