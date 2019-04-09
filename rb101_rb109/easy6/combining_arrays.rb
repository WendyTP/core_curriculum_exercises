=begin
request:Write a method that takes two Arrays as arguments, 
        and returns an Array that contains all of the values from the argument Array
rules: 
  - There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.
algorithm:
  - create an empty array (merged_array)
  - iterate through 1st given array
    - insert all the elements into merged_array
  - iterate through 2nd given array
    - only insert the elements that are not in merged_array
  - return merged_array  
=end

def merge(arr1, arr2)
  merged_array = []
  arr1.each do |element|
    merged_array << element
  end
  arr2.each do |element|
    merged_array << element unless merged_array.include?(element)
  end
  merged_array
end

p merge([1,3,5],[3,6,9])