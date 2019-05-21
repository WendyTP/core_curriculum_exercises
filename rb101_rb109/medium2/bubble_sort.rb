=begin
Write a method that takes an Array as an argument, 
and sorts that Array using the bubble sort algorithm as just described. 
Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. 
You may assume that the Array contains at least 2 elements.
=end

#first attempt
def bubble_sort!(array)
  loop do 
    index = 0
    swapped = false

    loop do
      if array[index] > array[index+1]
        array[index,2] = array[index,2].reverse
        swapped = true
      end
      index += 1
      break if index == (array.size) - 1
    end
    break unless swapped
  end
  nil
end



# another solution
=begin
def bubble_sort!(array)
  loop do
    swapped = false
    (array.size - 1).times do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]  
        swapped = true
      end    
    end

    break unless swapped
  end
  nil
end
=end


array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]


array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

