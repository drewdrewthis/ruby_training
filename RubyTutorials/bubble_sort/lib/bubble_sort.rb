def bubble_sort(arr)
  changes = true
  while changes do
    changes = false
    i = 0
    while i < arr.length && arr[i + 1]
      if arr[i] > arr[i+ 1]
        tmp = arr[i]
        arr[i] = arr[i + 1]
        arr[i + 1] = tmp
        changes = true
      end
      i += 1
    end
  end
  arr
end

def bubble_sort_by(arr)
  changes = true
  while changes do
    changes = false
    i = 0
    (arr.length-1).times do
      if yield(arr[i], arr[i+1]) > 0
        arr[i], arr[i+1] = arr[i+1], arr[i]
        changes = true
      end
      i += 1
    end
  end
  arr
end

