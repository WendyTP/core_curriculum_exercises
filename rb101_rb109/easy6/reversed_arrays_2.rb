=begin
request: Write a method that takes an Array, and returns a new Array with the elements of 
the original list in reverse order. Do not modify the original list.
rules:
  - not use Array#reverse or Array#reverse!
  - not use the method from previosu example
  - do not modify the original array
=end

def reverse(arr)
  reversed_array = []
  arr.each do |element|
    reversed_array.prepend(element)
  end
  reversed_array
end

p reverse([1,2,3,4])

list = [1,3,2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p new_list == [2, 3, 1]    #=> true