=begin
request: Write a method that takes an Array as an argument, 
and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively.
rules:
  - if the original array contains an odd number of elements, the middle element should be placed in the first half Array
algorithm:


=end

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

p halvsies([1, 2, 3, 4])
p halvsies([1, 5, 2, 4, 3])
p halvsies([5])
p halvsies([])