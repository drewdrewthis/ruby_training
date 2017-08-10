def stock_picker(arr)
  buy = 0
  result = []
  profit = 0
  len = arr.length - 1

  while buy < len
    for i in (buy..len) do
      diff = arr[i] - arr[buy]

      if profit < diff
        profit = diff
        result = [buy, i]
      end
    end

    buy += 1
  end

  result.to_s
end

puts stock_picker([1])
puts stock_picker([17,3,6,9,15,8,6,1,10])

