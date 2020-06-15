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
    if !drink.group.nil?
      render html: image_tag(drink.group.icon, class: html_class) unless drink.group.icon.nil?
    else
      render html: image_tag('no_group.png', class: html_class)
    end
  end

  def format_date(date)
    date.strftime('%d %B %Y')
  end
end
