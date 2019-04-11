=begin
request: Write a method that takes an Array as an argument, 
and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively.
rules:
  - if the original array contains an odd number of elements, the middle element should be placed in the first half Array
algorithm:
    - create a nested array 
    - iterate through the first half of the original array
    - insert elements into first inner array of the nested array
    - if original array length is greater than 1
    - condition iterate throuth the second half of the original array
    - insert elements into second inner array of the nested array
    - add the middle element to the first inner array, if the original array contains odd number elements
=end

# first attempt
def halvsies(arr)
  nested_arrays = [[],[]]
  arr_half_length = (arr.length)/2

  arr.each do |element|
    nested_arrays[0] << element
    break if nested_arrays[0].length == arr_half_length
  end

  if arr.length > 1
    arr.reverse.each do |element|
      nested_arrays[1].prepend element
      break if nested_arrays[1].length == nested_arrays[0].length
    end
  end
  
  if arr.length.odd? && arr.length > 1
    nested_arrays[0] << arr[arr_half_length]
  end
  
  nested_arrays
end

# possible solution # using Array#slice
=begin
def halvsies(array)
  first_half = array.slice(0, array.size / 2)
  if array.size.odd?
    first_half << array[array.size / 2]
  end
  second_half = array.slice(first_half.size, (array.size - first_half.size))
  [first_half, second_half]
end
=end

p halvsies([1, 2, 3, 4])
p halvsies([1, 5, 2, 4, 3])
p halvsies([5])
p halvsies([])