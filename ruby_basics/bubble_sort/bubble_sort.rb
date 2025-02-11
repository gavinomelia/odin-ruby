def bubble_sort(list)
  loop do
    swapped = false
    (list.length - 1).times do |i|
      if list[i] > list[i + 1]
        list[i], list[i + 1] = list[i + 1], list[i]
        swapped = true
      end
    end
    break unless swapped
  end
  list
end
