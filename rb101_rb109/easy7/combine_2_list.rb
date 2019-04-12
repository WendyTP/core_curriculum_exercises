=begin
request: Write a method that combines two Arrays passed in as arguments,
 and returns a new Array that contains all elements from both Array arguments,
  with the elements taken in alternation.
rules: 
  - assume not mutate the two given arrays
  - ssume that both input Arrays are non-empty, and that they have the same number of elements.
data: array
algorithm:
  - call the each_with_object method on the first argument, and pass in an empty array as the argument
  - iterate through the first argument array
    - set a varialbe (second_arg_index) = 0
    - at each iteration
      - insert an element from the frist arg array to the empty array
      - insert the second array[second_arg_index]
      - second_arg_index += 1
  - return the empty array  
=end

def interleave(arr1, arr2)
  second_arg_index = 0
  arr1.each_with_object([]) do |element, combined_array|
    combined_array << element
    combined_array << arr2[second_arg_index]
    second_arg_index += 1
  end

end

p interleave([1, 2, 3], ['a', 'b', 'c'])