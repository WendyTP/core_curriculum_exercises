=begin
input: an array (of numbers or empty array)
output: an array
rules:
  - assume input is valid array
  - return aother array with the same number of elements,
  - and each element has the running total from original array
  - return empty array if input is an empty array
data: array
algorithm:
  - set a varialbe (running_total) for an empty array
  - iterate through the input array:
    -  slice array from index 0 to current index, and add up the sum 
    - insert this sum to running_total
  return the updated running_total    
=end

def running_total(array)
  sum = 0
array.each_with_object([]) do |element,new_array| 
  new_array << (sum += element)
end
end  

# Use Array#map -> transofrm current array
=begin
def running_total(array)
  sum = 0
  array.map {|value| sum+= value}
end
=end

# first attempt
=begin
def running_total(input_array)
  total =[]
  input_array.each do |element|
    current_sum = input_array[0..input_array.index(element)].reduce(:+)
    total << current_sum
    
  end
  total
end
=end


p running_total([2,5,13])
p running_total([])
p running_total([14,11,7,15,20])