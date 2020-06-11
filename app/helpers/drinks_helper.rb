# frozen_string_literal: true

module DrinksHelper
  def drinks_total
    total = 'You have to drink'
    if @total_drinks > 1000
      total.concat(" #{@total_drinks / 1000}L")
    else
      total.concat(" #{@total_drinks}ml")
    end
  end

  def show_icon(drink)
    if !drink.group.nil?
      render html: image_tag(drink.group.icon) unless drink.group.icon.nil?
    else
      render html: image_tag('no_group.png')
    end
  end
end
