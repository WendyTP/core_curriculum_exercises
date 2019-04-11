=begin
request: Write a method that takes an Array, and returns a new Array with the elements of 
the original list in reverse order. Do not modify the original list.
rules:
  - not use Array#reverse or Array#reverse!
  - not use the method from previosu example
  - do not modify the original array
=end

#first attempt
def reverse(arr)
  reversed_array = []
  arr.each do |element|
    reversed_array.prepend(element)
  end
  reversed_array
end

# possible solution -- using each_with_object
=begin
def reverse(arr)
  arr.each_with_object([]) do |element, new_array|
    new_array.prepend(element)
  end
end    
=end   

p reverse([1,2,3,4])

list = [1,3,2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p new_list == [2, 3, 1]    #=> true