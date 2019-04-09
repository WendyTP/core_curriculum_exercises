=begin
request: Write a method that takes an Array as an argument, and reverses its elements in place; 
that is, mutate the Array passed into this method.
rules:
  - The return value should be the same Array object.
  - You may not use Array#reverse or Array#reverse!.
data: array
algorithm:
  - create an empty array (reversed_copy)
  - iterate through the given array
    - at each iteration, insert the element to the reversed_copy
  - delete the element from itself
  - iterate through the filled up array (reversed_copy)
    - at each iteration, insert the element to the given array  
  - return the updated given array 
=end

def reverse!(arr)
  temp_reversed_array = []
  arr.each do |element|
    temp_reversed_array.prepend(element)
  end
  
  arr.clear

  temp_reversed_array.each do |element|
    arr << element
  end
  
  arr
end

list = [1,2,3,4]
result = reverse!(list)
p result
puts list.object_id == result.object_id

list = []
result = reverse!(list)
p result
puts list.object_id == result.object_id


list = ["abc"]
result = reverse!(list)
p result
puts list.object_id == result.object_id


list = %w(a b e d c)
result = reverse!(list)
p result
puts list.object_id == result.object_id
