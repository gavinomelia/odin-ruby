def stock_picker(prices)
  min_day = 0
  min_price = prices.first
  best_days = [0, 0]
  max_profit = 0

  prices.each_with_index do |price, day|
    if price < min_price
      min_price = price
      min_day = day
    end

    profit = price - min_price
    if profit > max_profit
      max_profit = profit
      best_days = [min_day, day]
    end
  end

  best_days
end
