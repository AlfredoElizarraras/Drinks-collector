module DrinksHelper
  def drinks_total
    total = 'You have to drink'
    if @total_drinks > 1000
      total.concat(" #{@total_drinks / 1000}L")
    else
      total.concat(" #{@total_drinks}ml")
    end
  end
end
