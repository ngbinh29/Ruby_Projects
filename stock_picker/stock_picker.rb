def stock_picker(stocks)
  pairs_of_day = []
  min_value_index = stocks.index(stocks.min)
  max_value_index = stocks.index(stocks.max)
  if min_value_index < max_value_index
    picker = [min_value_index, max_value_index]
  else
    for index in 0..(stocks.length - 1) do
      for next_index in index..(stocks.length - 1) do
        pairs_of_day << [index, next_index]
      end
    end
    pairs_of_day.max do |pair1, pair2|
      buy_sell_1 = stocks[pair1[1]] - stocks[pair1[0]]
      buy_sell_2 = stocks[pair2[1]] - stocks[pair2[0]]
      buy_sell_1 <=> buy_sell_2
    end
  end
end

stock_prices = [17,3,6,9,15,8,6,1,10,15]

p stock_picker(stock_prices)