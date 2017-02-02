class Array

  def my_uniq
    result = []

    each do |el|
      result << el unless result.include?(el)
    end

    result
  end


  def two_sum
    result = []

    each_with_index do |el, idx|
      each_with_index do |el1,idx1|
        if el1 + el == 0
          result << [idx,idx1] unless idx == idx1 ||
          result.include?([idx1,idx])
        end
      end
    end
    result
  end

  def my_transpose
    result = []
    each_index do |x|
      row = []
      each do |array|
        row << array[x]
      end
      result << row
    end
    result
  end
end

def stock_picker(prices)
  raise "Not an array!" unless prices.is_a?(Array)
  raise ArgumentError if prices.empty?
  raise "Not enough prices" if prices.size < 2
  return [] if prices.all? { |el| el < 0}

  result = []
  highest_profit = 0
  prices.each_with_index do |price, idx|
    prices.each_with_index do |other_price, jdx|
      next if other_price - price <= highest_profit || other_price < 0 ||
      price < 0

      highest_profit = other_price - price
      result << [idx, jdx]
    end
  end

  result.last
end
