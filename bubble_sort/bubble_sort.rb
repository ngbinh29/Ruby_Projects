def bubble_sort(array)
  (array.length - 1).times do
    swap = 0
    for index in 0..(array.length - 2) do
      if array[index] > array[index + 1]
        swap += 1
        temp = array[index]
        array[index] = array[index + 1]
        array[index + 1] = temp
      end
    end
    break unless swap != 0
  end
  array
end