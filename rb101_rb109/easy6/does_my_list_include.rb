=begin
request: Write a method named include? that takes an Array and a search value as arguments. 
This method should return true if the search value is in the array, false if it is not.
rules: 
  - not use the Array#include?
data: array
algorithm:
  - call Array#select method on the given array, 
  - set the search value as the select criteria (element == search value)
  - return true if return value of the select method contains more than 0 items
=end

def include?(arr, search_value)
  selected_items = arr.select do |element|
    element == search_value
  end
  selected_items.length > 0
end

# another solution -- Array#find_index
=begin
def include?(arr, search_value)
  !!arr.find_index(search_value)
end

# using each method
def include?(array,value)
  array.each {|element| return true if element == value}
  false
end  
=end

p include?([1,2,3,4,5],3)
p include?([1,2,3,4,5], 6)
p include?([], 3)
p include?([nil], nil)
p include?([], nil)

