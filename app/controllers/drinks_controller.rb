class DrinksController < ApplicationController
  def index
    author = User.find(params[:author_id])
    redirect_to root_path if author.nil? || !(params[:drink] != 'true' || params[:drink] != 'false')

    if params[:drink] == 'true'
      @drinks = Drink.by_user(author.id)
      @drinks_title = 'All my drinks'
      @total_drinks = author.sum_drinks
    else
      @drinks = Drink.by_user(author.id)
      @drinks_title = 'All my external drinks'
      @total_drinks = author.sum_drinks
    end
  end
end
