# frozen_string_literal: true

class DrinksController < ApplicationController
  def index
    author = User.find(params[:author_id])
    show_drinks?(author)
    which_drinks_show(params[:drink] == 'true', author)
  end

  private

  def show_drinks?(author)
    redirect_to root_path if author.nil? || !(params[:drink] != 'true' || params[:drink] != 'false')
  end

  def which_drinks_show(drink, author)
    if drink
      @drinks = Drink.by_user(author.id)
      @drinks_title = 'All my drinks'
      @total_drinks = author.sum_drinks
    else
      @drinks = Drink.by_user(author.id, false)
      @drinks_title = 'All my external drinks'
      @total_drinks = author.sum_drinks(false)
    end
  end
end
