
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        first = yield(array[index - 1])
        second = yield(array[index])
        next if first <= second
      else
        next if array[index - 1] <= array[index]
      end
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end


array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) {|v| v.downcase}
p array



array = [1,7,4]
bubble_sort!(array)
p array

